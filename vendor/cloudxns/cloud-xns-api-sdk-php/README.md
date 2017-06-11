#CloudXNS-API-SDK-PHP 使用说明 #


##1 环境版本要求##

PHP >= 5.4.0


依赖[guzzlehttp版本5.3](https://github.com/guzzle/guzzle/tree/5.3)

##2 安装步骤##
###2.1安装Composer###
如果您还没有安装[Composer](https://getcomposer.org/),您可以通过[getcomposer.org](https://getcomposer.org/doc/00-intro.md#installation-nix)进行安装.

###2.2 安装运行CloudXNS API SDK 示例##
####2.2.1下载SDK源代码并安装####
您可以从[CloudXNS-API-SDK-PHP.zip](https://github.com/CloudXNS/CloudXNS-API-SDK-PHP/archive/master.zip) 下载zip包，解压后执行下边命令：
```shell
composer install
```
####2.2.2 修改API KEY####
修改demo文件夹下的php文件或者html目录下的demo.php文件中的API KEY：
```php
$api->setApiKey('xxxxxxxxxx');//修改成自己API KEY
$api->setSecretKey('xxxxxxxxxx');//修改成自己的SECERET KEY
```
####2.2.3 执行demo下的php文件或者访问html下的html文件####
###2.3 项目中使用CloudXNS API SDK###
####2.3.1 使用composer安装源文件####
切换到要存放SDK源代码的目录，执行以下命令
```shell
composer require "cloudxns/cloud-xns-api-sdk-php:*"
composer require "guzzlehttp/guzzle: ~5.0"
```
####2.3.2 程序中使用SDK示例，更多详见demo文件夹####
```php
require_once './vendor/autoload.php';//仅供参考，具体以项目中路径为准
$api = new \CloudXNS\Api();
$api->setApiKey('xxxxxxxxxx');//修改成自己API KEY
$api->setSecretKey('xxxxxxxxxx');//修改成自己的SECERET KEY
//获取域名列表
$api->domain->domainList();


//添加域名
$arr = array("domain"=>"cloudxns.net");
$api->domain->domainAdd($arr);


//删除域名
$api->domain->domainDelete('5568');
```
