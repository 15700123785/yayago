Ext.RoleField=Ext.extend(Ext.form.ComboBox ,{
    xtype:"combo",
    triggerAction:"all",
    fieldLabel:"标签",
    width:200,
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
