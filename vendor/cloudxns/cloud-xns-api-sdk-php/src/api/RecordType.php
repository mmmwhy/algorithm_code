<?php

/**
 * 记录类型列表的接口逻辑处理
 * 
 * @author CloudXNS <support@cloudxns.net>
 * @link https://www.cloudxns.net/
 * @copyright Copyright (c) 2015 Cloudxns.
 */

namespace CloudXNS;

use CloudXNS\Api;

final class RecordType extends Api {
    
    public function __construct() {
        $this->setApiType("RecordType");
    }
    
    /**
     * 记录类型列表
     * 
     * @return string
     */
    public function typeList() {
        //设置请求的方法
        $this->setMethod('GET');
        //初始化参数
        $this->initParam();
        //获取返回值
        return $this->response();
    }

}
