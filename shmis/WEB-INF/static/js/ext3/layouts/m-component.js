/*!
 * Ext JS Library 3.4.0
 * Copyright(c) 2015-2016 hzmoko.com
 * xuzw@hzmoko.com
 * http://hzmoko.com
 */
 
 /* 
  * ============================定义基本的功能组件===========================
  */
 
Ext.namespace("HZMOKO");

HZMOKO.createGrid = function() {
 
    var cm = new Ext.grid.ColumnModel([
                                           {header:'编号',dataIndex:'id'}
                                           ]);
        var data = [
                    ['1']
                    ];
        var store = new Ext.data.Store({
            proxy: new Ext.data.MemoryProxy(data),
            reader:new Ext.data.ArrayReader({},[{name:'id'}])
        });
        
        var grid = new Ext.grid.GridPanel({
            renderTo:'grid',
            store:store,
            cm:cm
        });
          
     return grid;
}

HZMOKO.createTree = function(divId,url,method) {
    
    var tree = new Ext.tree.TreePanel({
                id: 'tree-panel',
                renderTo: divId,
                title: '功能菜单',
                region:'north',
                split: true,
                height: 300,
                minSize: 150,
                autoScroll: true,
                
                // tree-specific configs:
                rootVisible: false,
                lines: false,
                singleExpand: true,
                useArrows: true,
                
                loader: new Ext.tree.TreeLoader({
                    dataUrl:url,
                    requestMethod:method
                }),
                
                root: new Ext.tree.AsyncTreeNode()
            });

    return tree;
}