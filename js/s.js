// ���͸�����;
WeixinJSBridge.on('menu:share:appmessage', function(argv){
WeixinJSBridge.invoke('sendAppMessage',{
"appid":appId,
"img_url":imgUrl,
"img_width":"640",
"img_height":"640",
"link":"http://txqasp.taobao.com/",
"desc":"һ�������߽̳�",
"title":"yige.org"
}, function(res) {})
});
// ��������Ȧ;
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
// ����΢��;
var weiboContent = '';
WeixinJSBridge.on('menu:share:weibo', function(argv){
WeixinJSBridge.invoke('shareWeibo',{
"content":title + link,
"url":link,
}, function(res) {
});
});
// �������Ͻǵ�ѡ��˵����;
WeixinJSBridge.call('hideOptionMenu');
}, false);