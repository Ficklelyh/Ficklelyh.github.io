<?php
require_once 'app.php';
$c = isset($_GET['c'])?$_GET['c']:'';
$k = isset($_GET['k'])?intval($_GET['k']):0;
switch ($c) {
case "robot":
$nc="管理机器人";//机器人名称
$key="robot";//机器人key
	 
	 $str=json_encode(array("msg"=>"".$_POST['msg']."","name"=>"".$nc."","key"=>"".$key."","type"=>"msg"),JSON_UNESCAPED_UNICODE);
	 file_put_contents(ROOT_PATH.MSGFILE, $str."\n" , FILE_APPEND|LOCK_EX);

break;


	 case "login":
		  //$arr['name'] = empty($_COOKIE[KEYS.'_name'])?nick():urldecode($_COOKIE[KEYS.'_name']);
	      //$arr['key'] = $_COOKIE[KEYS.'_key'];
		  $ref = $_SERVER["HTTP_REFERER"];
		  $url = parse_url($ref);		  
		  if($url['query']==LSTR){
		     $_SESSION[KEY.'login'] = 'admin';			  
		  } 
		  $user = mb_substr(strip_tags($_GET['n']),0,5,'utf-8');
		  if(empty($_COOKIE[KEYS.'_name'])){
		      $arr = nick($user);
		  }else{
			  $arr['name'] =urldecode($_COOKIE[KEYS.'_name']);
		      $arr['key'] = $_COOKIE[KEYS.'_key'];
		  }	 
		  get_token();
		  echo json_encode($arr); 
		  break;
	case 'send';
 	$arr['msg'] = strip_tags($_POST['msg']);
	$arr['name'] = strip_tags(urldecode($_COOKIE[KEYS.'_name']));
	$arr['key'] = strip_tags(urldecode($_COOKIE[KEYS.'_key']));
	if(check_post($arr) == false){
	   //logmsg(0);
	   $arr['type']= 'msg';
	   //$arr['msg']= '内容发送失败！';
	   $str = json_encode($arr);
	   exit($str);
	}
	$_SESSION[KEY.'time'] = time();
	unset($_SESSION[KEY . 'token']);
    get_token();
    $arr['msg'] = mb_substr($arr['msg'],0,140,'utf-8');
    
	  
	if($arr['msg'] =='刷新界面' && $_SESSION[KEY.'login'] == 'admin'){
	   file_put_contents(ROOT_PATH.MSGFILE, '' , LOCK_EX);
       $arr['type'] = 'sys';
	   $arr['msg'] = '已刷新清空界面';
	   $str = json_encode($arr);
	}else{
	  $arr['type']= 'msg';
	  $_SESSION[KEY.'msg'] = $arr['msg'];
	  $str = json_encode($arr);
	  file_put_contents(ROOT_PATH.MSGFILE, $str."\n" , FILE_APPEND|LOCK_EX);
	  
	  
	   if($arr['msg']=="菜单")
	  {
	 
	  post("http://".$_SERVER["HTTP_HOST"]."/app/ajax.php?c=robot","msg=🍀接口系统，访问系统🍀");
	  
	  }
	 else if(preg_match("/^(搜图) ?(.*?)\$/",$arr["msg"],$nr))
{
	  
	  $data=file_get_contents("http://huan.gjwa.cn/ipa/s.php?msg=".$nr[2]);
	  post("http://".$_SERVER["HTTP_HOST"]."/app/ajax.php?c=robot","msg=<img src=\"".$data."\"><br>".$nr[2]."的图片来了");
	  
	  }
	  
	 else if(preg_match("/^(ping) ?(.*?)\$/",$arr["msg"],$nr))
{
	  
	  $data=file_get_contents("http://huan.gjwa.cn/ipa/ping.php?url=".$nr[2]);
	  $data=str_replace("\n","<br>",$data);
	  post("http://".$_SERVER["HTTP_HOST"]."/app/ajax.php?c=robot","msg=以下内容：<br><br>".$data);
	  
	  }
	  
	 else  if($arr['msg']=="接口系统")
{
	 
	  post("http://".$_SERVER["HTTP_HOST"]."/app/ajax.php?c=robot","msg=🍀搜图[内容]<br>🍀天气[地区]<br>🍀ping[域名]<br>🍀随机一言<br>🍀歌词[歌名]<br>🍀聊天[内容]<br>🍀星座[星座名]<br>🍀百科[内容]");
	  
	  }
	  
	  	 else if(preg_match("/^(访问) ?(.*?)\$/",$arr["msg"],$nr))
{
	  
	  $data=file_get_contents($nr[2]);
	  post("http://".$_SERVER["HTTP_HOST"]."/app/ajax.php?c=robot","msg=以下内容：<br><br>".$data);
	  
	  }
	  
	  	 else if(preg_match("/^(百科) ?(.*?)\$/",$arr["msg"],$nr))
{
	  $data=file_get_contents("http://sqv6.com/api/api/bdbk.php?msg=".$nr[2]);
	  	  $data=str_replace("\n","<br>",$data);
	  post("http://".$_SERVER["HTTP_HOST"]."/app/ajax.php?c=robot","msg=以下内容：<br><br>".$data);
	  
	  }
	  
	  	 else if(preg_match("/^(星座) ?(.*?)\$/",$arr["msg"],$nr))
{
	  $data=file_get_contents("http://huan.gjwa.cn/ipa/xz.php?msg=".$nr[2]);
	  	  $data=str_replace("\n","<br>",$data);
	  post("http://".$_SERVER["HTTP_HOST"]."/app/ajax.php?c=robot","msg=以下内容：<br><br>".$data);
	  
	  }
	  
	  	 else if(preg_match("/^(歌词) ?(.*?)\$/",$arr["msg"],$nr))
{
	  $data=file_get_contents("http://huan.gjwa.cn/ipa/gc.php?msg=".$nr[2]."&n=1");
	  	  $data=str_replace("\n","<br>",$data);
	  post("http://".$_SERVER["HTTP_HOST"]."/app/ajax.php?c=robot","msg=以下内容：<br><br>".$data);
	  
	  }
	  
	  	 else if(preg_match("/^(聊天) ?(.*?)\$/",$arr["msg"],$nr))
{
	  $data=file_get_contents("http://huan.gjwa.cn/ipa/xiaoai.php?msg=".$nr[2]."&n=text");
	  post("http://".$_SERVER["HTTP_HOST"]."/app/ajax.php?c=robot","msg=以下内容：<br><br>".$data);
	  
	  }
	  
	   if($arr['msg']=="随机一言")
{
	  
	  $data=file_get_contents("http://huan.gjwa.cn/ipa/su.php");
	  post("http://".$_SERVER["HTTP_HOST"]."/app/ajax.php?c=robot","msg=以下内容：<br><br>".$data);
	  
	  }
	  
	else if($arr['msg']=="访问系统")
{
	  
	  post("http://".$_SERVER["HTTP_HOST"]."/app/ajax.php?c=robot","msg=🍀访问[内容]");
	  
	  }
	  
	  	 else if(preg_match("/^(天气) ?(.*?)\$/",$arr["msg"],$nr))
{
	  
	  $data=file_get_contents("http://sqv6.com/api/api/bdtq.php?msg=".$nr[2]);
	  $data=str_replace("\n","<br>",$data);
	  post("http://".$_SERVER["HTTP_HOST"]."/app/ajax.php?c=robot","msg=以下内容：<br><br>".$data);
	  
	  }
	  
	 else  if($arr['msg']=="测试")
	  {
	  
	  
	  post("http://".$_SERVER["HTTP_HOST"]."/app/ajax.php?c=robot","msg=测试成功");
	  
	  	  }
	  
	 else  if($arr['msg']=="欢欢")
	  {
	  
	  
	  post("http://".$_SERVER["HTTP_HOST"]."/app/ajax.php?c=robot","msg=叫我主人干啥发[菜单]不就好了");
	  
	  	  }
	  
	 else  if($arr['msg']=="机器人")
	  {
	  
	  
	  post("http://".$_SERVER["HTTP_HOST"]."/app/ajax.php?c=robot","msg=叫我干嘛，发[菜单]就可以了");
	  
	  	  }
	  
	 else  if($arr['msg']=="你是谁")
	  {
	  
	  
	  post("http://".$_SERVER["HTTP_HOST"]."/app/ajax.php?c=robot","msg=我是欢欢的管理机器人<br>主人QQ：2955036981<br>QQ群聊：1148876238<br>欢迎加入我们");
	  
	  }
	 
	}		
    //addnum(1);
	echo $str;
	break;
case 'msg':
	//$sk = $_
    $str = file_get_contents(ROOT_PATH.MSGFILE);
    $arr = explode("\n",$str);
	$count = count($arr)-1;
	//echo ($count);exit();
	if($k==$count){
	  $msg['count'] = $count;
	  $msg['list'] = [];
	  echo json_encode($msg);
	  exit();
	}
	if($k>count($arr)-1){
        $msg['type'] = 'sys';
        $msg['msg'] = 'rebot';
		$res['list'][] = json_encode($msg);
        $res['count'] = $count;
        echo json_encode($res); 
		exit();
	}
	//$k = $k==0?$k:$k+1;
	if($k<($count-50)){
	   $k= $count-50;
	}
	$arr = array_slice($arr,$k);
	array_pop($arr);
	$msg['count'] = $count;
	$msg['list'] = $arr;
	echo json_encode($msg);
	break;
}

if(empty($_FILES["file"]["name"]))
{
}
else
{
$lx=explode("/",$_FILES["file"]["type"]);

if($lx[0]=="image")
{
move_uploaded_file($_FILES["file"]["tmp_name"],"./tu/".$_FILES["file"]["name"]);

$nc=strip_tags(urldecode($_COOKIE[KEYS.'_name']));
$key=$_COOKIE[KEYS.'_key'];
	 
	 $str=json_encode(array("msg"=>"<img src=\"./app/tu/".$_FILES["file"]["name"]."\">","name"=>"".$nc."","key"=>"".$key."","type"=>"msg"),JSON_UNESCAPED_UNICODE);
	 file_put_contents(ROOT_PATH.MSGFILE, $str."\n" , FILE_APPEND|LOCK_EX);
	 
echo'<script language="javascript">window.location.href="../index.php";</script>';

}
else
{
echo'<script language="javascript">alert("请上传图片或视频！");window.location.href="../index.php";</script>';
}
}