<?php

/**
 * 解析统计的接口逻辑处理
 * 
 * @author CloudXNS <support@cloudxns.net>
 * @link https://www.cloudxns.net/
 * @copyright Copyright (c) 2015 Cloudxns.
 */
namespace CloudXNS;

use CloudXNS\Api;

final class Statistics extends Api {
    
    public function __construct() {
        $this->setApiType("Statistics");
    }
    
    /**
     * 解析统计列表
     * 
     * @param inetger $domainId 域名ID
     * @param string $host 主机名,查询全部传 all
     * @param string $code 统计区域 Id 或统 ISP Id,查询全部传 all
     * @param string $startDate 开始时间
     * @param string $endDate 结束时间
     * @return string
     */
    public function statisticsList($domainId = 0, $host = 'all', $code = 'all', $startDate = '', $endDate = '') {
        //设置URL扩展
        $this->setUrlExtend("$domainId?host=$host&code=$code&start_date=$startDate&end_date=$endDate");
        //设置请求的方法
        $this->setMethod('GET');
        //初始化参数
        $this->initParam();
        //获取返回值
        return $this->response();
    }

}

