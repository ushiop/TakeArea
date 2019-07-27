library Server{
    //与服务器存档相关的库

    public struct Server{
        
        static method Global_GetOnlyRead(string keyname)->string{//读取一个只读的、名为keyname的全局存档
            return DzAPI_Map_GetMapConfig(keyname);
        }

        static method Global_Get(string keyname)->string{//读取一个名为keyname的全局存档
            return DzAPI_Map_Global_GetStoreString(keyname);
        }

        static method Global_Set(string keyname,string value){//保存一个名为keyname的全局存档为value
            DzAPI_Map_Global_StoreString(keyname,value);
        }

    }
}