/*!
*
*   @author xzw
*   
*   1。 调用应用程序的本地软件上文件内容
*   2. 请求服务端的内容，并返回json类型数据
*   3. json解析
*   4. 将数据插入到指定位置
*   5. 启动时初始化，并保存为全局数据（相当于容器）
*   
*   （创建一个全局对象--初始化）
**/

var HZMOKO = {
    
    value:[],
    
    init:(function(){
        /*调用本地信息*/
        
        /*远程调用服务的配置信息*/
        $.ajax({
            url:'/shmis/background/menumanager/data/menus/array',
            success:function(data) {
                HZMOKO.value = data;
            }
        });
        
        
    })()
    
//    insertDataToHtml:function(val,id) {
//        $('#'+id).html(val);
//    },
//    clearDataInHtml:function(id) {
//        $('#'+id).html('');
//    }

};

