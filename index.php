<!DOCTYPE html>
<html>
<head>

    <style>


        body {font:normal 100% Arial,sans-serif;font-size:14px; font-size:1.4rem; }
    </style>



    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">



</head>
<body>
<img src="./Vape.png" alt="some_text">
<div class="attribution">
    <div class="container">
    <form action="" method="post"> 
        用户<input name="uin" type="text" value=""><br>
		密码<input name="password" type="password" value=""><br>
        <input name="sub" type="submit" value="确认">
    </form>
</div>

</body>
</html>
<?php
#接收前端传来的num和sub两个参数，参数值为value所对应的值
if (isset($_POST['sub']) && is_numeric($_POST['uin'])){

    $header = array(
        'Host: wskacchm.mini1.cn:14100',
        'Content-Type:application/json;charset=UTF-8',

    );

// curl 请求
    function ihttp_request($curl, $https = true, $method = 'GET', $header = array(), $data = null)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $curl);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        if ($https) {
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        }
        if ($method == 'POST') {
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        }
        $content = curl_exec($ch);
        if ($content === false) {
            return "web request failed:";
            exit();
        }
        curl_close($ch);
        return $content;
    }

    $url = "https://wskacchm.mini1.cn:14000/login/new_auth/"; //api地址
    $uin=$_POST['uin'];
    $password=$_POST['password'];








    $reqData ='{"uin":"'.$uin.'","passwd":"'.$password.'","DeviceID":"WIN806bc63567c8e1db3dd743d129ba8420","apiid":"299","cltversion":"72960"}';
    $request_data = ihttp_request($url, true, "POST", $header, $reqData);
    $zzll_data = json_decode($request_data, true);
    $name = empty($zzll_data['msg']) ? 0 : $zzll_data['msg'];



    echo '-----登录账号-----------------------<div class="attribution"><pre>';
    echo '迷你号:' . $uin .PHP_EOL.'密码:'.$password.PHP_EOL.$name.PHP_EOL;
    echo '</pre>';


#PHP读JSON组
    $data= $zzll_data['baseinfo'];
    $user= $data['RoleInfo'];
    $username= $user['NickName'];
    $email= $data['Email'];
    $apiid= $data['apiid'];
    $bean=  $data['minibean'];
    $coin=  $data['minicoin'];
    $phone= $data['Phone'];
    $data= $zzll_data['authinfo'];
    $token= $data['token'];
    $sign= $data['sign'];





    echo '-----关联数据-----------------------<pre>'.'<H1>';
    echo '<img src="https://image.mini1.cn/roleicon/392.png" alt="" data-v-3144c970="">'.PHP_EOL;
    echo  '用户名:' .$username.PHP_EOL;
    echo  '豆子:' .$bean.PHP_EOL;
    echo  '迷你币:' .$coin.PHP_EOL;
    echo  '手机号:' .$phone.PHP_EOL;
    echo  '邮箱:' .$email.PHP_EOL;
    echo  '渠道:' .$apiid.PHP_EOL;

    echo  'Sign:' .$sign.PHP_EOL;



    echo '</pre>'.'</H1>';




















}
else
    echo "no number";
?>
