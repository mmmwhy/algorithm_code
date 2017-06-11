<?php
/**
 * 解析记录的接口逻辑处理
 *
 * @author CloudXNS <support@cloudxns.net>
 * @link https://www.cloudxns.net/
 * @copyright Copyright (c) 2015 Cloudxns.
 */

namespace CloudXNS;

use CloudXNS\Api;

final class Ddns extends Api {

    public function __construct()
    {
        $this->setApiType("Ddns");

    }
    /**
     * 解析记录列表
     *
     * @param string $domain 域名
     * @param string $ip ip 多个ip用|分割
     * @param integer $lineId 线路id
     * @return string
     */
    public function ddns($domain,$ip='',$lineId = 1)
    {
        $arr = array(
            'domain' => $domain,
            'ip' => $ip,
            'line_id' => $lineId
        );
        //设置参数体
        $this->setData(json_encode($arr));
        //设置请求的方法
        $this->setMethod('POST');
        //初始化参数
        $this->initParam();
        //获取返回值
        return $this->response();
    }
}
