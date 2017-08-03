Ext.RoleField=Ext.extend(Ext.form.ComboBox ,{
    id:"rolename",
    xtype:"combo",
    triggerAction:"all",
    fieldLabel:"用户角色",
    width:200,
    editable:false,
    store:{
        xtype:"jsonstore",
        autoLoad:true,
        url:"/shmis/background/rolemanager/data/roles",
        idProperty:"id",
        root:"root",
        totalProperty:"results",
        fields:["id","name"]
    },
    valueField:"id",
    displayField:"name",
    initComponent: function(){
        Ext.RoleField.superclass.initComponent.call(this);
    }
});




