<?php

namespace App\Controllers\Admin;

use App\Services\Auth;
use App\Services\Config;
use App\Utils\Hash;
use App\Utils\Tools;
use App\Utils\Radius;
use App\Utils\Wecenter;
use voku\helper\AntiXSS;
use App\Models\User;
use App\Models\Ip;
use App\Models\Relay;
use App\Utils\GA;
use App\Controllers\AdminController;


class UserController extends AdminController
{
    public function index($request, $response, $args)
    {
        $table_config['total_column'] = array("op" => "操作", "id" => "ID", 
                            "port" => "连接端口","user_name" => "用户名",
                            "remark" => "备注", "method" => "加密方式",                           
                            "online_ip_count" => "在线IP数", 
                            "used_traffic" => "已用流量/GB",
                            "reg_date" => "注册时间","account_expire_in" => "账户过期时间"
                            );
        $table_config['default_show_column'] = array("op", "id","port", "user_name", "remark", "method","online_ip_count","used_traffic","reg_date","account_expire_in");
        $table_config['ajax_url'] = 'user/ajax';
        return $this->view()->assign('table_config', $table_config)->display('admin/user/index.tpl');
    }

    public function search($request, $response, $args)
    {
        $pageNum = 1;
        $text=$args["text"];
        if (isset($request->getQueryParams()["page"])) {
            $pageNum = $request->getQueryParams()["page"];
        }

        $users = User::where("email", "LIKE", "%".$text."%")->orWhere("user_name", "LIKE", "%".$text."%")->orWhere("im_value", "LIKE", "%".$text."%")->orWhere("port", "LIKE", "%".$text."%")->orWhere("remark", "LIKE", "%".$text."%")->paginate(20, ['*'], 'page', $pageNum);
        $users->setPath('/admin/user/search/'.$text);



        //Ip::where("datetime","<",time()-90)->get()->delete();
        $total = Ip::where("datetime", ">=", time()-90)->orderBy('userid', 'desc')->get();


        $userip=array();
        $useripcount=array();
        $regloc=array();

        $iplocation = new QQWry();
        foreach ($users as $user) {
            $useripcount[$user->id]=0;
            $userip[$user->id]=array();

            $location=$iplocation->getlocation($user->reg_ip);
            $regloc[$user->id]=iconv('gbk', 'utf-8//IGNORE', $location['country'].$location['area']);
        }



        foreach ($total as $single) {
            if (isset($useripcount[$single->userid])) {
                if (!isset($userip[$single->userid][$single->ip])) {
                    $useripcount[$single->userid]=$useripcount[$single->userid]+1;
                    $location=$iplocation->getlocation($single->ip);
                    $userip[$single->userid][$single->ip]=iconv('gbk', 'utf-8//IGNORE', $location['country'].$location['area']);
                }
            }
        }


        return $this->view()->assign('users', $users)->assign("regloc", $regloc)->assign("useripcount", $useripcount)->assign("userip", $userip)->display('admin/user/index.tpl');
    }

    public function sort($request, $response, $args)
    {
        $pageNum = 1;
        $text=$args["text"];
        $asc=$args["asc"];
        if (isset($request->getQueryParams()["page"])) {
            $pageNum = $request->getQueryParams()["page"];
        }


        $users->setPath('/admin/user/sort/'.$text."/".$asc);



        //Ip::where("datetime","<",time()-90)->get()->delete();
        $total = Ip::where("datetime", ">=", time()-90)->orderBy('userid', 'desc')->get();


        $userip=array();
        $useripcount=array();
        $regloc=array();

        $iplocation = new QQWry();
        foreach ($users as $user) {
            $useripcount[$user->id]=0;
            $userip[$user->id]=array();

            $location=$iplocation->getlocation($user->reg_ip);
            $regloc[$user->id]=iconv('gbk', 'utf-8//IGNORE', $location['country'].$location['area']);
        }



        foreach ($total as $single) {
            if (isset($useripcount[$single->userid])) {
                if (!isset($userip[$single->userid][$single->ip])) {
                    $useripcount[$single->userid]=$useripcount[$single->userid]+1;
                    $location=$iplocation->getlocation($single->ip);
                    $userip[$single->userid][$single->ip]=iconv('gbk', 'utf-8//IGNORE', $location['country'].$location['area']);
                }
            }
        }


        return $this->view()->assign('users', $users)->assign("regloc", $regloc)->assign("useripcount", $useripcount)->assign("userip", $userip)->display('admin/user/index.tpl');
    }


    public function edit($request, $response, $args)
    {
        $id = $args['id'];
        $user = User::find($id);
        if ($user == null) {
        }
        return $this->view()->assign('edit_user', $user)->display('admin/user/edit.tpl');
    }

    public function update($request, $response, $args)
    {
        $id = $args['id'];
        $user = User::find($id);

        $email1=$user->email;

        $user->email =  $request->getParam('email');

        $email2=$request->getParam('email');

        $passwd=$request->getParam('passwd');

        Radius::ChangeUserName($email1, $email2, $passwd);


        if ($request->getParam('pass') != '') {
            $user->pass = Hash::passwordHash($request->getParam('pass'));
            Wecenter::ChangeUserName($email1, $email2, $request->getParam('pass'), $user->user_name);
            $user->clean_link();
        }

        $user->auto_reset_day =  $request->getParam('auto_reset_day');
        $user->auto_reset_bandwidth = $request->getParam('auto_reset_bandwidth');
        $origin_port = $user->port;
        $user->port =  $request->getParam('port');

        $relay_rules = Relay::where('user_id', $user->id)->where('port', $origin_port)->get();
        foreach ($relay_rules as $rule) {
            $rule->port = $user->port;
            $rule->save();
        }

        $user->passwd = $request->getParam('passwd');
        $user->protocol = $request->getParam('protocol');
        $user->protocol_param = $request->getParam('protocol_param');
        $user->obfs = $request->getParam('obfs');
        $user->obfs_param = $request->getParam('obfs_param');
        $user->is_multi_user = $request->getParam('is_multi_user');
        $user->transfer_enable = Tools::toGB($request->getParam('transfer_enable'));
        $user->invite_num = $request->getParam('invite_num');
        $user->method = $request->getParam('method');
        $user->node_speedlimit = $request->getParam('node_speedlimit');
        $user->node_connector = $request->getParam('node_connector');
        $user->enable = $request->getParam('enable');
        $user->is_admin = $request->getParam('is_admin');
        $user->node_group = $request->getParam('group');
        $user->ref_by = $request->getParam('ref_by');
        $user->remark = $request->getParam('remark');
        $user->class = $request->getParam('class');
        $user->class_expire = $request->getParam('class_expire');
        $user->expire_in = $request->getParam('expire_in');

        $user->forbidden_ip = str_replace(PHP_EOL, ",", $request->getParam('forbidden_ip'));
        $user->forbidden_port = str_replace(PHP_EOL, ",", $request->getParam('forbidden_port'));

        if (!$user->save()) {
            $rs['ret'] = 0;
            $rs['msg'] = "修改失败";
            return $response->getBody()->write(json_encode($rs));
        }
        $rs['ret'] = 1;
        $rs['msg'] = "修改成功";
        return $response->getBody()->write(json_encode($rs));
    }

    public function delete($request, $response, $args)
    {
        $id = $request->getParam('id');
        $user = User::find($id);

        $email1=$user->email;

        if (!$user->kill_user()) {
            $rs['ret'] = 0;
            $rs['msg'] = "删除失败";
            return $response->getBody()->write(json_encode($rs));
        }
        $rs['ret'] = 1;
        $rs['msg'] = "删除成功";
        return $response->getBody()->write(json_encode($rs));
    }

    public function ajax($request, $response, $args)
    {
        $pageNum = 1;
        if (isset($request->getQueryParams()["page"])) {
            $pageNum = $request->getQueryParams()["page"];
        }

        $users = User::skip(($pageNum - 1) * 100)->limit(100)->get();
        $total_conut = User::count();
        if($total_conut < $pageNum * 100) {
            $res['next'] = 0;
        } else {
            $res['next'] = 1;
        }
        $res['data'] = array();
        $c = Auth::getUser();
        foreach ($users as $user) {
          array_push($res['data'], $user->get_table_json_array());
        }
        

        return $this->echoJson($response, $res);
    }

    public function createuser($request, $response, $next)
    {
        $c = Auth::getUser();
        $name =  $request->getParam('name');
        $email =  $name;
        $email = strtolower($email);
        $passwd = $name;
        $imtype = $request->getParam('imtype');
        $wechat = 1;
        // check pwd length
        if (strlen($passwd)<3) {
            $res['ret'] = 0;
            $res['msg'] = "密码最少4位";
            return $response->getBody()->write(json_encode($res));
        }
        if($wechat==1){
            // check email
            $user = User::where('email', $email)->first();
            if ($user != null) {
                $res['ret'] = 0;
                $res['msg'] = $email."被注册了";
                return $response->getBody()->write(json_encode($res));
            }
            // do reg user
            $user = new User();
            $antiXss = new AntiXSS();
            $user->user_name = $antiXss->xss_clean($name);
            $user->email = $email;
            $user->pass = Hash::passwordHash($passwd);
            $user->passwd = $passwd;
            $user->port = Tools::getAvPort();
            $user->t = 0;
            $user->u = 0;
            $user->d = 0;
            $user->method = Config::get('reg_method');
            $user->protocol = Config::get('reg_protocol');
            $user->protocol_param = Config::get('reg_protocol_param');
            $user->obfs = Config::get('reg_obfs');
            $user->obfs_param = Config::get('reg_obfs_param');
            $user->forbidden_ip = Config::get('reg_forbidden_ip');
            $user->forbidden_port = Config::get('reg_forbidden_port');
            $user->im_type =  $imtype;
            $user->im_value =  $antiXss->xss_clean($wechat);
            $user->transfer_enable = Tools::toGB(Config::get('defaultTraffic'));
            $user->invite_num = Config::get('inviteNum');
            $user->auto_reset_day = Config::get('reg_auto_reset_day');
            $user->auto_reset_bandwidth = Config::get('reg_auto_reset_bandwidth');
            $user->ref_by = $c->id;
            $user->expire_in=date("Y-m-d H:i:s", time()+$imtype*30*86400);
            $user->reg_date=date("Y-m-d H:i:s");
            $user->reg_ip=$_SERVER["REMOTE_ADDR"];
            $user->node_connector=4;
            $user->money=0;
            $user->class=0;
            $user->plan='A';
            $user->node_speedlimit=0;
            $user->theme=Config::get('theme');
            $group=Config::get('ramdom_group');
            $Garray=explode(",", $group);
            $user->node_group=$Garray[rand(0, count($group)-1)];
            $ga = new GA();
            $secret = $ga->createSecret();
            $user->ga_token=$secret;
            $user->ga_enable=0;
            if ($user->save()) {
                $res['ret'] = 1;
                $res['msg'] = "成功生成".$wechat."个账号";
                return $response->getBody()->write(json_encode($res));
            }

        }
        for ($x=1; $x<=$wechat; $x++) {
            // check email
            $email = $email.$x;
            $user = User::where('email', $email)->first();
            if ($user != null) {
                $res['ret'] = 0;
                $res['msg'] = $email."被注册了";
                return $response->getBody()->write(json_encode($res));
            }
            // do reg user
            $user = new User();
            $antiXss = new AntiXSS();
            $user->user_name = $antiXss->xss_clean($name).$x;
            $user->email = $email;
            $user->pass = Hash::passwordHash($passwd);
            $user->passwd = Tools::genRandomChar(4);
            $user->port = Tools::getAvPort();
            $user->t = 0;
            $user->u = 0;
            $user->d = 0;
            $user->method = Config::get('reg_method');
            $user->protocol = Config::get('reg_protocol');
            $user->protocol_param = Config::get('reg_protocol_param');
            $user->obfs = Config::get('reg_obfs');
            $user->obfs_param = Config::get('reg_obfs_param');
            $user->forbidden_ip = Config::get('reg_forbidden_ip');
            $user->forbidden_port = Config::get('reg_forbidden_port');
            $user->im_type =  $imtype;
            $user->im_value =  $antiXss->xss_clean($wechat);
            $user->transfer_enable = Tools::toGB(Config::get('defaultTraffic'));
            $user->invite_num = Config::get('inviteNum');
            $user->auto_reset_day = Config::get('reg_auto_reset_day');
            $user->auto_reset_bandwidth = Config::get('reg_auto_reset_bandwidth');
            $user->ref_by = $c->id;
            $user->expire_in=date("Y-m-d H:i:s", time()+$imtype*30*86400);
            $user->reg_date=date("Y-m-d H:i:s");
            $user->reg_ip=$_SERVER["REMOTE_ADDR"];
            $user->node_connector=4;
            $user->money=0;
            $user->class=0;
            $user->plan='A';
            $user->node_speedlimit=0;
            $user->theme=Config::get('theme');
            $group=Config::get('ramdom_group');
            $Garray=explode(",", $group);
            $user->node_group=$Garray[rand(0, count($group)-1)];
            $ga = new GA();
            $secret = $ga->createSecret();
            $user->ga_token=$secret;
            $user->ga_enable=0;
            if (!$user->save()) {
                $res['ret'] = 0;
                $res['msg'] = "未知错误";
                return $response->getBody()->write(json_encode($res));
            }
        }
        $res['ret'] = 1;
        $res['msg'] = "成功生成".$wechat."个账号";
        return $response->getBody()->write(json_encode($res));
    }

    public function quickcreateuser($request, $response, $next)
    {
		$c = Auth::getUser();
        $imtype = $request->getParam('imtype');
      	$name =  $request->getParam('name').$imtype.'m';
        $email =  $name;
        $email = strtolower($email);
        $wechat = $request->getParam('wechat');
      	$x=1; 
      	$email = $name.$x;
      	$user = User::where('email', $email)->first();

      while($user != null) { 			
          	// check email          	        	     
  			$x++;
          	$email = $name.$x;
        	$user = User::where('email', $email)->first();              	
		} 
      	// do reg user
        $user = new User();
        $antiXss = new AntiXSS();
        $user->user_name = $email;
        $user->email = $email;
        $user->passwd = Tools::genRandomChar(4);
        $user->pass = Hash::passwordHash($user->passwd);
        $user->port = Tools::getAvPort();
        $user->t = 0;
        $user->u = 0;
        $user->d = 0;
        $user->method = Config::get('reg_method');
        $user->protocol = Config::get('reg_protocol');
        $user->protocol_param = Config::get('reg_protocol_param');
        $user->obfs = Config::get('reg_obfs');
        $user->obfs_param = Config::get('reg_obfs_param');
        $user->forbidden_ip = Config::get('reg_forbidden_ip');
        $user->forbidden_port = Config::get('reg_forbidden_port');
        $user->im_type =  $imtype;
        $user->im_value =  $antiXss->xss_clean($wechat);
        $user->transfer_enable = Tools::toGB(Config::get('defaultTraffic'));
        $user->invite_num = Config::get('inviteNum');
        $user->auto_reset_day = Config::get('reg_auto_reset_day');
        $user->auto_reset_bandwidth = Config::get('reg_auto_reset_bandwidth');
        $user->ref_by = $c->id;
        $user->expire_in=date("Y-m-d H:i:s", time()+$imtype*30*86400);
        $user->reg_date=date("Y-m-d H:i:s");
        $user->reg_ip=$_SERVER["REMOTE_ADDR"];
        $user->node_connector=4;
        $user->money=0;
        $user->class=0;
        $user->plan='A';
        $user->node_speedlimit=0;
        $user->theme=Config::get('theme');
        $group=Config::get('ramdom_group');
        $Garray=explode(",", $group);
        $user->node_group=$Garray[rand(0, count($group)-1)];
        $ga = new GA();
        $secret = $ga->createSecret();
        $user->ga_token=$secret;
        $user->ga_enable=0;
        if ($user->save()) {
            $res['ret'] = 1;
            $res['msg'] = "成功生成".$email.",账号有效期：".$imtype."个月";
            return $response->getBody()->write(json_encode($res));
        }
        $res['ret'] = 0;
       	$res['msg'] = "成功失败".$name;
       	return $response->getBody()->write(json_encode($res));
      	
      	
		
    }

}
