// 发送给好友;
WeixinJSBridge.on('menu:share:appmessage', function(argv){
WeixinJSBridge.invoke('sendAppMessage',{
"appid":appId,
"img_url":imgUrl,
"img_width":"640",
"img_height":"640",
"link":"http://txqasp.taobao.com/",
"desc":"一个网在线教程",
"title":"yige.org"
}, function(res) {})
});
// 分享到朋友圈;
WeixinJSBridge.on('menu:share:timeline', function(argv){
WeixinJSBridge.invoke('shareTimeline',{
"img_url":imgUrl,
"img_width":"640",
"img_height":"640",
"link":link,
"desc": desc,
"title":title
}, function(res) {
});
});
// 分享到微博;
var weiboContent = '';
WeixinJSBridge.on('menu:share:weibo', function(argv){
WeixinJSBridge.invoke('shareWeibo',{
"content":title + link,
"url":link,
}, function(res) {
});
});
// 隐藏右上角的选项菜单入口;
WeixinJSBridge.call('hideOptionMenu');
}, false);