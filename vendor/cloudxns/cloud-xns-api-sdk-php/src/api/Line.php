<?php

/**
 * 线路&区域&ISP列表的接口逻辑处理
 * 
 * @author CloudXNS <support@cloudxns.net>
 * @link https://www.cloudxns.net/
 * @copyright Copyright (c) 2015 Cloudxns.
 */

namespace CloudXNS;

use CloudXNS\Api;

final class Line extends Api {
    
    public function __construct() {
        $this->setApiType("Line");
    }
    
    /**
     * 线路的列表
     * 
     * @return string
     */
    public function lineList() {
        //设置请求的方法
        $this->setMethod('GET');
        //初始化参数
        $this->initParam();
        //获取返回值
        return $this->response();
    }
    
    /**
     * 区域的列表
     * 
     * @return string
     */
    public function regionList() {
        //设置URL扩展
        $this->setUrlExtend('region');
        //设置请求的方法
        $this->setMethod('GET');
        //初始化参数
        $this->initParam();
        //获取返回值
        return $this->response();
    }
    
    /**
     * ISP的列表
     * 
     * @return string
     */
    public function ispList() {
        //设置URL扩展
        $this->setUrlExtend('isp');
        //设置请求的方法
        $this->setMethod('GET');
        //初始化参数
        $this->initParam();
        //获取返回值
        return $this->response();
    }
}
