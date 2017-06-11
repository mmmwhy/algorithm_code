<?php

/**
 * NS服务器列表的接口逻辑处理
 * 
 * @author CloudXNS <support@cloudxns.net>
 * @link https://www.cloudxns.net/
 * @copyright Copyright (c) 2015 Cloudxns.
 */

namespace CloudXNS;

use CloudXNS\Api;

final class Ns extends Api {
    
    public function __construct() {
        $this->setApiType("Ns");
    }
    
    /**
     * NS服务器列表
     * 
     * @return string
     */
    public function nsList() {
        //设置请求的方法
        $this->setMethod('GET');
        //初始化参数
        $this->initParam();
        //获取返回值
        return $this->response();
    }

}
