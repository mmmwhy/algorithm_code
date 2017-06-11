<?php

/**
 * 配置文件
 *
 * @author CloudXNS <support@cloudxns.net>
 * @link https://www.cloudxns.net/
 * @copyright Copyright (c) 2016 Cloudxns.
 */

namespace CloudXNS;

/**
 * 请用Composer安装依赖包，并在根目录下执行:
 * php composer.phar require "guzzlehttp/guzzle:~5.0"命令。
 * 参考地址：https://github.com/guzzle/guzzle.git
 */
class Api {
    protected $apiKey = '';
    protected $secretKey = '';
    protected $protocol = '';
    protected $url = '';
    protected $urlExtend = '';
    protected $data = '';
    protected $date = '';
    protected $hash = '';
    protected $host = 'www.cloudxns.net/api2';
    protected $client;
    protected $request;
    protected $apiType;
    protected $flag;
    protected $method;
    protected $header;
    protected $response;
    public function __get($property){
        $this->module = ucfirst($property);

        require_once "api/{$this->module}.php";
        $className = "\\CloudXNS\\{$this->module}";

        //实例化类
        $domain = new $className();
        $domain->setApiKey($this->apiKey);
        $domain->setSecretKey($this->secretKey);
        $domain->setProtocol($this->flag);
        $domain->setUrlExtend($this->urlExtend);
        $domain->setData($this->data);
        return $domain;
    }
    /**
     * 构造函数
     */
    public function initParam() {
        $baseUrl = $this->urlParam($this->apiType);
        if(isset($this->urlExtend) && $this->urlExtend)
        {
            $baseUrl= $baseUrl.'/';
            $this->url = $baseUrl . $this->urlExtend;
        }else{
            $this->url = $baseUrl;
        }
        //计算hash值
        $this->setHeader();
        $this->request = $this->sendRequest();
    }
    /**
     * 设置请求方式
     * $param string $method 请求方式GET,DELETE,POST,PUT等
    */
    public function setMethod($method)
    {
        $this->method = $method;
    }
    /**
     * 根据不同的请求类型,返回不同的URL
     * @return string
     */
    public function urlParam() {
        $a_url = array(
            'Domain' => $this->protocol . '://' . $this->host . '/domain', //域名
            'RecordType' => $this->protocol . '://' . $this->host . '/type', //记录类型
            'Line' => $this->protocol . '://' . $this->host . '/line', //线路
            'Host' => $this->protocol . '://' . $this->host . '/host', //主机记录
            'Record' => $this->protocol . '://' . $this->host . '/record', //解析记录
            'Statistics' => $this->protocol . '://' . $this->host . '/domain_stat', //解析量统计
            'Ns' => $this->protocol . '://' . $this->host . '/ns_server'  ,        //NS服务器
            'Ddns' => $this->protocol . '://' . $this->host . '/ddns'          //DDNS
        );
        $type = $this->apiType;

        return $a_url[$type];
    }

    /**
     * hash值的计算规则
     * @return string
     */
    public function doHash() {
        return md5($this->apiKey . $this->url . $this->data . $this->date . $this->secretKey);
    }

    /**
     * 设置请求的header
     */
    public function setHeader() {
        //设置请求的头部
        $this->date = date('r',time());
        $this->header = array(
            'API-KEY' => $this->apiKey,
            'API-REQUEST-DATE' =>$this->date,
            'API-HMAC' => $this->doHash(),
            'API-FORMAT' => 'json'
        );
    }
    /**
     * 设置apiKey
     * 
     * @param string $apiKey
     */
    public function setApiKey($apiKey) {
        $this->apiKey = $apiKey;
    }

    /**
     * 设置secretKey
     * 
     * @param string $secretKey
     */
    public function setSecretKey($secretKey) {
        $this->secretKey = $secretKey;
    }

    /**
     * 设置protocol
     * @param boolean $flag
     **/
    public function setProtocol($flag = true) {
        $this->flag = $flag;
        if($flag){
            $this->protocol = 'https';
        }else{
            $this->protocol = 'http';
        }
    }
    /**
     * 设置data
     * 
     * @param string $data
     */
    public function setData($data) {
        $this->data = $data;
    }

    /**
     * 设置apiType
     * 
     * @param string $apiType
     */
    public function setApiType($apiType) {
        $this->apiType = ucfirst($apiType);
    }
    /**
     * 设置urlExtend
     * 
     * @param string $urlExtend
     */
    public function setUrlExtend($urlExtend) {
        $this->urlExtend = $urlExtend;
    }

    public function sendRequest()
    {
        $baseUrl = $this->urlParam($this->apiType);
        if(isset($this->urlExtend) && $this->urlExtend)
        {
            $baseUrl= $baseUrl.'/';
        }
        $client = new \GuzzleHttp\Client(['base_url' =>$baseUrl ]);
        $option = array(
            'body'=>$this->data,
            'headers'=>$this->header,
            'verify'=>false,
            'exceptions' => false
        );
        $method = strtolower($this->method);
        $this->response = $client->$method(isset($this->urlExtend)?$this->urlExtend:null,$option);
    }
    /**
     * 将返回的结果，输出呈现
     */
    public function response() {
        $body = $this->response->getbody();
        $contents = $body->getContents();
        return $contents;
    }

}
