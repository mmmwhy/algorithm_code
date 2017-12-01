<?php
/**
 * Created by PhpStorm.
 * User: kaguya
 * Date: 2017/11/30
 * Time: 16:59
 */

namespace App\Controllers\Client;


use App\Controllers\BaseController;
use App\Models\Code;
use App\Models\Shop;
use App\Services\Auth;
use App\Utils\Pay;

class ClientShopController extends BaseController
{
    public function GetShop($request, $response, $args){
        $user = Auth::getUser();
        //var_dump($user->isLogin);
        if(!$user->isLogin){
            return $response->withRedirect('/api/redirect?target=/client/shop');
        }
        $pageNum = 1;
        if (isset($request->getQueryParams()["page"])) {
            $pageNum = $request->getQueryParams()["page"];
        }
        $shops = Shop::where("status", 1)->paginate(15, ['*'], 'page', $pageNum);
        $shops->setPath('/user/shop');

        return $this->view()->assign('shops', $shops)->display('client/shop.tpl');
    }

    public function GetCode($request, $response, $args)
    {
        $user = Auth::getUser();
        //var_dump($user->isLogin);
        if(!$user->isLogin){
            return $response->withRedirect('/api/redirect?target=/client/code');
        }
        $pageNum = 1;
        if (isset($request->getQueryParams()["page"])) {
            $pageNum = $request->getQueryParams()["page"];
        }
        $codes = Code::where('type', '<>', '-2')->where('userid', '=', $user->id)->orderBy('id', 'desc')->paginate(15, ['*'], 'page', $pageNum);
        $codes->setPath('/user/code');
        return $this->view()->assign('codes', $codes)->assign('pmw', Pay::getHTML($user))->display('client/code.tpl');
    }

}