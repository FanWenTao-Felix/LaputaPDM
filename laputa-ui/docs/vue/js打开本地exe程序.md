# js打开本地exe程序

2017-08-14 18:53:06  更多



版权声明：本文为博主原创文章，遵循[ CC 4.0 BY-SA ](http://creativecommons.org/licenses/by-sa/4.0/)版权协议，转载请附上原文出处链接和本声明。本文链接：https://blog.csdn.net/llso9001/article/details/77165199

一：通过IE浏览器自带的ActiveX控件打开

​        function Exec(filePath) {       //filePath:参数，如果不需要参数则不需要，根据自己的需求来     
​            if (window.ActiveXObject) {
​                try {                   
​                    var shell = new ActiveXObject("WScript.Shell");
​                    var fso = new ActiveXObject("Scripting.FileSystemObject");
​                    var exePath = shell.RegRead("HKEY_CLASSES_ROOT\\MBSFiles\\Shell\\Open\\Command\\");  //根据注册表信息找到本地应用程序安装路径
​                    exePath = exePath.split("%")[0].substring(0, exePath.length - 1);                   
​                    filePath = $("#hfFilePath").val() + filePath.split("HaiKou\\")[1];
​                    var para = exePath + " " + filePath; //如果没有参数则去掉filePath
​                    if (fso.FileExists(exePath)) {   //检测是否安装了                    
​                        shell.exec(para); //打开
​                    }
​                    else {
​                        alert("未能检测到本地已安装该软件");
​                    }
​                } catch (e) {
​                    alert(e.message);
​                }               
​            }
​            else {
​                alert("请使用IE并正确配置浏览器！");
​            }
​        }



二：通过协议打开

​     function Exec(filePath) {           
​            try {
​                var shell = new ActiveXObject("WScript.Shell");
​                var fso = new ActiveXObject("Scripting.FileSystemObject");
​                filePath = filePath.split("HaiKou\\")[1].toString().split("\\"); //参数
​                filePath = $("#hfFilePath").val() + filePath[0] + "//" + filePath[1] + "//" + filePath[2];
​                var exePath = shell.RegRead("HKEY_CLASSES_ROOT\\MBSFiles\\Shell\\Open\\Command\\");         
​                exePath = exePath.split("%")[0].split("\"")[0];
​                if (fso.FileExists(exePath)) {                      
​                    window.location.href = "Aglodongbe://" + filePath;  //Aglodongbe为注册表中将要打开的exe的项 ；直接在浏览器中输入也能打开exe程序
​                }
​                else {
​                    alert("未能检测到本地已安装辅助工具");
​                }
​             } catch (e) {
​                 alert("未能检测到本地已安装该软件");
​             }                    
​        }