<?php

/**
 * 导入相关的文件
 *
 * @author CloudXNS <support@cloudxns.net>
 * @link https://www.cloudxns.net/
 * @copyright Copyright (c) 2015 Cloudxns.
 */
require_once '../vendor/autoload.php';
use CloudXNS\Api;

$api->setApiKey('xxxxxxxxxx');
$api->setSecretKey('xxxxxxxxxx');
$protocol = true;
$action = isset($_POST['action']) ? $_POST['action'] : 'domainList';

if (empty($apiKey) || empty($secretKey)) {
    ajaxReturn(20000, 'API KEY或者SECRET KEY不能为空！');
}

$api = new Api();
$api->setApiKey($apiKey);
$api->setSecretKey($secretKey);

if ($protocol) {
    $api->setProtocol(false);
} else {
    $api->setProtocol(true);
}

switch ($action) {
    case 'domainList':
        domainList($api);
        break;
    case 'domainAdd':
        domainAdd($api);
        break;
    case 'domainDelete':
        domainDelete($api);
        break;
    case 'typeList':
        typeList($api);
        break;
    case 'nsList':
        nsList($api);
        break;
    case 'hostList':
        hostList($api);
        break;
    case 'hostDelete':
        hostDelete($api);
        break;
    case 'lineList':
        lineList($api);
        break;
    case 'regionList':
        regionList($api);
        break;
    case 'ispList':
        ispList($api);
        break;
    case 'statisticsList':
        statisticsList($api);
        break;
    case 'recordList':
        recordList($api);
        break;
    case 'recordAdd':
        recordAdd($api);
        break;
    case 'spareAdd':
        spareAdd($api);
        break;
    case 'recordUpdate':
        recordUpdate($api);
        break;
    case 'recordDelete':
        recordDelete($api);
        break;
    default:
        return false;
}

/**
 * 域名列表 
 * 
 * @return string
 */
function domainList($api) {
    $domain = json_decode($api->domain->domainList(), true);
    $html = '<tr class="bg_white h_30"><td colspan="9">暂无数据</td></tr>';
    if (!empty($domain['data'])) {
        $html = '';
        foreach ($domain['data'] as $k => $v) {
            $html .= "<tr>
                <td>{$v['id']}</td>
                <td>{$v['domain']}</td>
                <td>{$v['status']}</td>
                <td>{$v['take_over_status']}</td>
                <td>{$v['level']}</td>
                <td>{$v['ttl']}</td>
                <td><a href='#' class='delete' param='{$v['id']}'>删除</a></td>
            </tr>";
        }
    }
    ajaxReturn(1, $html);
}

/**
 * 域名的添加
 * 
 * @return string
 */
function domainAdd($api) {
    $domainName = isset($_POST['domain']) ? $_POST['domain'] : '';
    if (empty($domainName)) {
        ajaxReturn(30000, '域名不能为空！');
    }
    echo $api->domain->domainAdd($domainName);
}

/**
 * 域名的删除
 * 
 * @return string
 */
function domainDelete($api) {
    $id = isset($_POST['id']) ? intval($_POST['id']) : 0;
    if (empty($id)) {
        ajaxReturn(30001, '域名ID不能为空！');
    }

    echo $api->domain->domainDelete($id);
}

/**
 * 记录类型列表
 * 
 * @return string
 */
function typeList($api) {
    $type = json_decode($api->recordType->typeList(), true);
    $html = '';
    if (!empty($type['data'])) {
        $data = implode(', ', $type['data']);
        $html .= "<tr>
            <td>{$data}</td>
        </tr>";
    }
    ajaxReturn(1, $html);
}

/**
 * ns服务器列表
 * 
 * @return string
 */
function nsList($api) {
    $ns = json_decode($api->ns->nsList(), true);
    $html = '';
    if (!empty($ns['data'])) {
        foreach ($ns['data'] as $k => $v) {
            $server = implode(', ', $v['ns_server']);
            $html .= "<tr>
                <td>域名等级：{$v['level']}</td>
                <td>{$server}</td>
            </tr>";
        }
    }
    ajaxReturn(1, $html);
}

/**
 * 主机列表
 * 
 * @return string
 */
function hostList($api) {
    $id = isset($_POST['id']) ? intval($_POST['id']) : 0;
    if (empty($id)) {
        ajaxReturn(30001, '域名ID不能为空！');
    }
    $host = json_decode($api->host->hostList($id), true);
    $html = '<tr class="bg_white h_30"><td colspan="5">暂无数据</td></tr>';
    if (!empty($host['hosts'])) {
        $html = '';
        foreach ($host['hosts'] as $k => $v) {
            $html .= "<tr>
                <td>{$v['id']}</td>
                <td>{$v['host']}</td>
                <td>{$v['record_num']}</td>
                <td>{$v['domain_name']}</td>
                <td><a href='#' class='delete' param='{$v['id']}'>删除</a></td>
            </tr>";
        }
    }
    ajaxReturn(1, $html);
}

/**
 * 删除主机
 * 
 * @return string
 */
function hostDelete($api) {
    $id = isset($_POST['id']) ? intval($_POST['id']) : 0;
    if (empty($id)) {
        ajaxReturn(30001, '域名ID不能为空！');
    }
    echo $api->host->hostDelete($id);
}

/**
 * 线路列表
 * 
 * @return string
 */
function lineList($api) {
    $line = json_decode($api->line->lineList(), true);

    $html = '';
    if (!empty($line['data'])) {
        $html .= '<table class="simple"><thead><tr>'
                . '<th>默认</th>'
                . '<th>运营商</th>'
                . '<th>区域组</th>'
                . '<th>省份</th>'
                . '</tr>'
                . '</thead></table>';
        $html .= doLine($line['data']);
    }
    ajaxReturn(1, $html);
}

/**
 * 区域列表
 * 
 * @return string
 */
function regionList($api) {
    $region = json_decode($api->line->regionList(), true);
    $html = '';
    if (!empty($region['data'])) {
        $html = '<table class="simple"><thead><tr>'
                . '<th>组成区域的线路id</th>'
                . '<th>中文名称</th>'
                . '<th>英文名称</th>'
                . '</tr>'
                . '</thead><tbody id="domain_list">';
        foreach ($region['data'] as $k => $v) {
            $html .= "<tr>
                <td>{$v['id']}</td>
                <td>{$v['chinese_name']}</td>
                <td>{$v['english_name']}</td>
            </tr>";
        }
        $html .= '</tbody></table>';
    }

    ajaxReturn(1, $html);
}

/**
 * isp列表
 * 
 * @return string
 */
function ispList($api) {
    $isp = json_decode($api->line->ispList(), true);

    $html = '';
    if (!empty($isp['data'])) {
        $html = '<table class="simple"><thead><tr>'
                . '<th>组成ISP的线路id</th>'
                . '<th>中文名称</th>'
                . '<th>英文名称</th>'
                . '</tr>'
                . '</thead><tbody id="domain_list">';
        foreach ($isp['data'] as $k => $v) {
            $html .= "<tr>
                <td style='word-break:break-all;'>{$v['id']}</td>
                <td width='15%'>{$v['chinese_name']}</td>
                <td width='15%'>{$v['english_name']}</td>
            </tr>";
        }
        $html .= '</tbody></table>';
    }
    ajaxReturn(1, $html);
}

/**
 * 处理线路列表的数据
 */
function doLine($arr) {
    $html = '<table class="simple2">';

    foreach ($arr as $k => $v) {
        $html .= "<tr>";
        $html .= "<td width='30%' style='text-align: left;'>{$v['chinese_name']}[{$v['id']}]</td>";

        if (array_key_exists('children', $v) && !empty($v['children'])) {
            $html .= "<td>";
            $html .= doLine($v['children']);
            $html .= "</td>";
        }
        $html .= "</tr>";
    }
    $html .= '</table>';
    return $html;
}

/**
 * 域名的统计
 */
function statisticsList($api) {
    $id = isset($_POST['id']) ? intval($_POST['id']) : 0;
    $host = isset($_POST['host']) ? $_POST['host'] : 'all';
    $code = isset($_POST['code']) ? $_POST['code'] : 'all';
    $startTime = isset($_POST['startTime']) ? $_POST['startTime'] : 0;
    $endTime = isset($_POST['endTime']) ? $_POST['endTime'] : 0;
    echo $api->statistics->statisticsList($id, $host, $code, $startTime, $endTime);
}

/**
 * 解析记录列表
 * 
 * @return string
 */
function recordList($api) {
    $id = isset($_POST['id']) ? intval($_POST['id']) : 0;
    $hostId = isset($_POST['hostId']) ? intval($_POST['hostId']) : 0;

    $record = json_decode($api->record->recordList($id, $hostId, 0, 30), true);
    $html = '<tr class="bg_white h_30"><td colspan="9">暂无数据</td></tr>';
    if (!empty($record['data'])) {
        $html = '';
        foreach ($record['data'] as $k => $v) {
            if (array_key_exists('spare_value', $v)) {
                $spareHtml = "<a href='#' title='{$v['spare_value']}'>备</a>";
                $bakIp = $v['spare_value'];
            } else {
                $spareHtml = "<a href='#' class='spare' id='{$id}' host='{$v['host_id']}' record='{$v['record_id']}' title='请添加备IP'>添加备IP</a>";
                $bakIp = '';
            }
            $html .= "<tr>
                <td>{$v['host']}</td>
                <td>{$v['type']}</td>
                <td>{$v['line_zh']}</td>
                <td>{$v['mx']}</td>
                <td>{$v['value']}{$spareHtml}</td>
                <td>{$v['status']}</td>
                <td>
                    <a href='#' class='edit' id='{$id}' host='{$v['host']}' value='{$v['value']}' type='{$v['type']}' mx='{$v['mx']}' ttl='{$v['ttl']}' lineId='{$v['line_id']}' bakIp='{$bakIp}' record='{$v['record_id']}'>编辑</a>
                    <a href='#' id='{$id}' record='{$v['record_id']}' class='delete'>删除</a>
                </td>
            </tr>";
        }
    }
    ajaxReturn(1, $html);
}

/**
 * 新增解析记录
 * 
 * @return string
 */
function recordAdd($api) {
    $id = isset($_POST['id']) ? intval($_POST['id']) : 0;
    $host = isset($_POST['host']) ? $_POST['host'] : '';
    $value = isset($_POST['value']) ? $_POST['value'] : '';
    $type = isset($_POST['type']) ? $_POST['type'] : '';
    $mx = isset($_POST['mx']) ? $_POST['mx'] : '';
    $ttl = isset($_POST['ttl']) ? $_POST['ttl'] : '';
    $lineId = isset($_POST['lineId']) ? intval($_POST['lineId']) : 1;

    echo $api->record->recordAdd($id, $host, $value, $type, $mx, $ttl, $lineId);
}

/**
 * 新增备记录
 * 
 * @return string
 */
function spareAdd($api) {
    $id = isset($_POST['id']) ? intval($_POST['id']) : 0;
    $hostId = isset($_POST['hostId']) ? intval($_POST['hostId']) : 0;
    $recordId = isset($_POST['recordId']) ? intval($_POST['recordId']) : 0;
    $value = isset($_POST['value']) ? $_POST['value'] : '';

    echo $api->record->spareAdd($id, $hostId, $recordId, $value);
}

/**
 * 更新解析记录
 * 
 * @return string
 */
function recordUpdate($api) {
    $id = isset($_POST['id']) ? intval($_POST['id']) : 0;
    $host = isset($_POST['host']) ? $_POST['host'] : '';
    $value = isset($_POST['value']) ? $_POST['value'] : '';
    $type = isset($_POST['type']) ? $_POST['type'] : '';
    $mx = isset($_POST['mx']) ? $_POST['mx'] : '';
    $ttl = isset($_POST['ttl']) ? $_POST['ttl'] : '';
    $lineId = isset($_POST['lineId']) ? intval($_POST['lineId']) : 1;
    $bakIp = isset($_POST['bakIp']) ? $_POST['bakIp'] : '';
    $recordId = isset($_POST['record']) ? intval($_POST['record']) : 0;

    echo $api->record->recordUpdate($id, $host, $value, $type, $mx, $ttl, $lineId, $bakIp, $recordId);
}

/**
 * 删除解析记录
 * 
 * @return string
 */
function recordDelete($api) {
    $id = isset($_POST['id']) ? intval($_POST['id']) : 0;
    $record = isset($_POST['record']) ? intval($_POST['record']) : 0;

    echo $api->record->recordDelete($record, $id);
}

/**
 * 
 * @param integer $code 状态码
 * @param string $msg 消息提示
 * @param array $data 数据的展示
 */
function ajaxReturn($code, $msg = '', $data = array()) {
    echo json_encode(array('code' => $code, 'message' => $msg, 'data' => $data));
    exit;
}
