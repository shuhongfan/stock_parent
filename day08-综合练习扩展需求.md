---
typora-copy-images-to: imgs
---

# 1.用户管理

## 1.多条件综合查询

### 1.1 多条件综合查询接口说明

#### 1）原型效果

![1642413277524](imgs/1642413277524.png)

#### 2）接口说明

```
功能描述：多条件综合查询用户分页信息，条件包含：分页信息 用户创建日期范围
服务路径：/api/users
服务方法：Post
```

请求参数格式：

```
{
	"pageNum":"1",
	"pageSize":"20",
	"username":"",
	"nickName":"",
	"startTime":"",
	"endTime":""
}
```

响应数据格式：

```
{
    "code": 1,
    "data": {
        "totalRows": 12,
        "totalPages": 1,
        "pageNum": 1,
        "pageSize": 20,
        "size": 12,
        "rows": [
            {
                "id": 1237361915165020161,
                "username": "admin",
                "password": "$2a$10$JqoiFCw4LUj184ghgynYp.4kW5BVeAZYjKqu7xEKceTaq7X3o4I4W",
                "phone": "13888888888",
                "realName": "小池",
                "nickName": "超级管理员",
                "email": "875267425@qq.com",
                "status": 1,
                "sex": 1,
                "deleted": 1,
                "createId": null,
                "updateId": "1237361915165020161",
                "createWhere": 1,
                "createTime": "2019-09-22T11:38:05.000+00:00",
                "updateTime": "2020-04-07T10:08:52.000+00:00",
                "createUserName": null,
                "updateUserName": "admin"
            },
      		//.....
        ]
    }
}
```



### 1.2 添加用户接口说明

#### 1）原型效果

![1642413481274](imgs/1642413481274.png)

#### 2）接口说明

```
功能描述：添加用户信息
服务路径：/api/users
服务方法：Post
```

请求参数格式：

```
{
	"username":"mike",
	"password":"20",
	"phone":"15367945613",
	"email":"123@qwe.cn",
	"nickName":"jane",
	"realName":"kangkang",
	"sex":"1",
	"createWhere":"1",
	"status":"1"
}
```

响应参数格式：

```
{
    "code": 1,
    "msg": "操作成功"
}
```

### 1.3 获取用户具有的角色信息接口说明

#### 1）原型效果

![1644398752969](imgs/1644398752969.png)

#### 2）接口说明

```
功能描述：获取用户具有的角色信息，以及所有角色信息
服务路径：/user/roles/{userId}
服务方法：Get
请求参数：String userId
```

响应参数格式：

```json
{
"code": 1,
"data": {
    "ownRoleIds": [
        1237258113002901515
    ],
        "allRole": [
        {
            "id": 1237258113002901512,
            "name": "超级管理员",
            "description": "我是超级管理员",
            "status": 1,
            "createTime": "2020-01-06T15:37:45.000+00:00",
            "updateTime": "2021-12-09T23:08:02.000+00:00",
            "deleted": 1
        },
        {
            "id": 1237258113002901513,
            "name": "标记用户角色测试",
            "description": "标记用户角色测试",
            "status": 1,
            "createTime": "2020-01-08T02:53:35.000+00:00",
            "updateTime": "2021-12-28T10:16:21.000+00:00",
            "deleted": 1
        },
       //..............
        
    ]
}
}
```


### 1.4 更新用户角色信息接口说明

#### 1）原型效果

![1644398784145](imgs/1644398784145.png)

#### 2）接口说明

```
功能描述：更新用户角色信息
服务路径：/user/roles
服务方法：Put
```

请求参数格式：

```yaml
{
    "userId": 
    	1247078461865070592,
    "roleIds": [
        1237258113002901515,
        1245949043784421376
    ]
}
```

响应数据格式：

```
{
    "code": 1,
    "msg": "操作成功"
}
```



### 1.5 批量删除用户信息接口说明

#### 1）原型效果

![1644398954735](imgs/1644398954735.png)

#### 2）接口说明

```json
功能描述： 批量删除用户信息，delete请求可通过请求体携带数据
服务路径：/user
服务方法：Delete
```

请求数据格式：

~~~json
 [
        1473296822679244800,
        1473296022544453632
 ]
~~~

​	接口提示：请求参数：@RequestBody List<Long> userIds

响应数据格式：

~~~json
{
    "code": 1,
    "msg": "操作成功"
}
~~~



### 1.6 根据用户id查询用户信息

#### 1）原型效果

![1644399036899](imgs/1644399036899.png)

#### 2）接口说明

```
功能描述： 根据用户id查询用户信息
服务路径：/user/info/{userId}
服务方法：Get
请求参数：Long id
```

响应数据格式：

```
{
    "code": 1,
    "data": {
        "id": 1247515643591397376,
        "username": "admin123",
        "phone": "13699999999",
        "nickName": "admin测试",
        "realName": "admin测试",
        "sex": 1,
        "status": 1,
        "email": "admin123@qq.com"
    }
}
```

### 1.7 更新用户信息

#### 1）原型效果

![1644398578874](imgs/1644398578874.png)

#### 2）接口说明

```
功能描述： 根据id更新用户基本信息
服务路径：/api/user
服务方法：PUT
```

请求参数格式：

~~~json
{
    id: 123456789
    username: 'zhangsan'
    phone: '18811023034'
    email: '345@163.com'
    nickName: '老王'
    realName: '王五'
    sex: '1'
    createWhere: '1'
    status: '1'
}
~~~

响应数据格式：

```
 {    
 	"code": 1,    
 	"msg": "操作成功"
 }
```

# 2.角色管理

## 2.角色处理器

### 2.1 分页查询当前角色信息

#### 1）原型效果

![1644232542742](imgs/1644232542742.png)

#### 2）接口说明

```
功能描述： 分页查询当前角色信息
服务路径： /api/roles
服务方法：Post
```

请求参数格式：

```
{
	"pageNum":1,
	"pageSize":10
}
```

响应数据格式：

```
{
    "code": 1,
    "data": {
        "totalRows": 10,
        "totalPages": 1,
        "pageNum": 1,
        "pageSize": 10,
        "size": 10,
        "rows": [
            {
                "id": 1237258113002901512,
                "name": "超级管理员",
                "description": "我是超级管理员",
                "status": 1,
                "createTime": "2020-01-06T15:37:45.000+00:00",
                "updateTime": "2021-12-09T23:08:02.000+00:00",
                "deleted": 1
            },
            {
                "id": 1237258113002901513,
                "name": "标记用户角色测试",
                "description": "标记用户角色测试",
                "status": 1,
                "createTime": "2020-01-08T02:53:35.000+00:00",
                "updateTime": "2021-12-28T10:16:21.000+00:00",
                "deleted": 1
            },
         //.........
        ]
    }
}
```

### 2.2 添加角色回显权限选项功能-1

#### 1）原型效果

![1644232518903](imgs/1644232518903.png)

#### 2）接口说明

```
功能描述： 树状结构回显权限集合,底层通过递归获取权限数据集合
服务路径： /api/permissions/tree/all
服务方法：GET
请求参数：无
```

响应格式：

```
{
    "code": 1,
    "data": [
        {
            "id": "1236916745927790564",
            "title": "组织管理",
            "icon": "el-icon-menu",
            "path": "/org",
            "name": "org",
            "children": [
                {
                    "id": "1236916745927790560",
                    "title": "菜单权限管理",
                    "icon": "el-icon-menu",
                    "path": "/menus",
                    "name": "menus",
                    "children": [
                        {
                            "id": "1236916745927790563",
                            "title": "删除菜单权限",
                            "icon": "",
                            "path": "/api/permission",
                            "name": "",
                            "children": []
                        },
                        {
                            "id": "1236916745927790565",
                            "title": "查询菜单权限列表权限",
                            "icon": "",
                            "path": "/api/permissions",
                            "name": "",
                            "children": []
                        },
                        {
                            "id": "1236916745927790577",
                            "title": "更新菜单权限",
                            "icon": "",
                            "path": "/api/permission",
                            "name": "",
                            "children": []
                        },
                        {
                            "id": "1236916745927790582",
                            "title": "新增菜单权限",
                            "icon": "",
                            "path": "/api/permission",
                            "name": "",
                            "children": []
                        }
                    ]
                },
                {
                    "id": "1236916745927790575",
                    "title": "用户管理",
                    "icon": "el-icon-user-solid",
                    "path": "/user",
                    "name": "user",
                    "children": [
                        {
                            "id": "1236916745927790556",
                            "title": "删除用户权限",
                            "icon": "",
                            "path": "/api/user",
                            "name": "",
                            "children": []
                        },
                        {
                            "id": "1236916745927790561",
                            "title": "新增用户权限",
                            "icon": "",
                            "path": "/api/user",
                            "name": "",
                            "children": []
                        },
                        {
                            "id": "1236916745927790568",
                            "title": "查询用户信息列表权限",
                            "icon": "",
                            "path": "/api/users",
                            "name": "",
                            "children": []
                        },
                        {
                            "id": "1236916745927790579",
                            "title": "赋予用户角色权限",
                            "icon": "",
                            "path": "/api/user/roles",
                            "name": "",
                            "children": []
                        },
                        {
                            "id": "1236916745927790580",
                            "title": "更新用户信息权限",
                            "icon": "",
                            "path": "/api/user",
                            "name": "",
                            "children": []
                        }
                    ]
                },
                {
                    "id": "1236916745927790578",
                    "title": "角色管理",
                    "icon": "el-icon-user",
                    "path": "/roles",
                    "name": "roles",
                    "children": [
                        {
                            "id": "1236916745927790562",
                            "title": "更新角色权限",
                            "icon": "",
                            "path": "/api/role",
                            "name": "",
                            "children": []
                        },
                        {
                            "id": "1236916745927790570",
                            "title": "删除角色权限",
                            "icon": "",
                            "path": "/api/role/*",
                            "name": "",
                            "children": []
                        },
                        {
                            "id": "1236916745927790572",
                            "title": "新增角色权限",
                            "icon": "",
                            "path": "/api/role",
                            "name": "",
                            "children": []
                        },
                        {
                            "id": "1236916745927790574",
                            "title": "角色详情权限",
                            "icon": "",
                            "path": "/api/role/*",
                            "name": "",
                            "children": []
                        },
                        {
                            "id": "1236916745927790583",
                            "title": "查询角色列表权限",
                            "icon": "",
                            "path": "/api/roles",
                            "name": "",
                            "children": []
                        }
                    ]
                }
            ]
        },
        {
          //......
        }
        ]
 }       
```

### 2.2 添加角色和角色关联权限-2

#### 1）原型效果

![1644232998566](imgs/1644232998566.png)

#### 2）接口说明

```
功能描述： 添加角色和角色关联权限
服务路径： /api/role
服务方法：Post
```

请求参数格式：

```
{
	"name":"trevol",
	"description":"I am Trevol",
	"permissionsIds":[
		1236916745927790568,
		1236916745927790564
		]
}
```

响应格式：

```
{
    "code": 1,
    "msg": "操作成功"
}
```

### 2.3 根据角色id查找对应的权限id集合

#### 1）原型效果

![1644233266689](imgs/1644233266689.png)

#### 2）接口说明

```
功能描述： 添加角色和角色关联权限
服务路径： /api/role/{roleId}
服务方法：Get
请求参数：String roleId
```

响应数据格式：

```
{
    "code": 1,
    "data": [
        "1236916745927790580",
        "1236916745927790558",
        "1236916745927790556",
        "1236916745927790578",
        "1236916745927790579",
        "1236916745927790557",
        "1236916745927790577"		
        /........
    ]
}
```



### 2.4 更新角色信息，包含角色关联的权限信息

#### 1）原型效果

![1644233266689](imgs/1644233266689.png)

#### 2）接口说明

```
功能描述： 添加角色和角色关联权限
服务路径： /role
服务方法：Put
```

请求参数格式：

```yaml
{
    "id": 1483338014502690844,
    "name": "vvvvvvvvvvvvvvvvvvvvv",
    "description": "vvvvvvvvvvvvvvvvvv",
    "permissionsIds":[
        1236916745927790564,
        1236916745927790577,
        1236916745927790568
    ]
}
```

响应数据类型:

```
{
    "code": 1,
    "msg": "操作成功"
}
```



### 2.5 根据角色id删除角色信息

#### 1）原型效果

![1644233624883](imgs/1644233624883.png)

#### 2）接口说明

```
功能描述： 添加角色和角色关联权限
服务路径： /role/{roleId}
服务方法：Delete
请求参数：String roleId
```

响应数据类型:

```
{
    "code": 1,
    "msg": "操作成功"
}
```



### 2.6 更新角色的状态信息

#### 1）原型效果

![1644233697696](imgs/1644233697696.png)

#### 2）接口说明

```
功能描述： 更新用户的状态信息
服务路径： /role/{roleId}/{status}
服务方法：Post
```

响应数据类型:

```
{
    "code": 1,
    "msg": "操作成功"
}
```

# 3.权限管理

## 3.权限管理器

### 3.1 权限列表展示功能

#### 1）原型效果

![1644233839418](imgs/1644233839418.png)

#### 2）接口说明

```
功能描述： 查询所有权限集合
服务路径： /api/permissions
服务方法：Get
请求参数：无
```

响应数据格式:

```Json
{
    "code": 1,
    "data": [
        {
            "id": 1236916745927790556,
            "code": "btn-user-delete",
            "title": "删除用户权限",
            "icon": "",
            "perms": "sys:user:delete",
            "url": "/api/user",
            "method": "DELETE",
            "name": "",
            "pid": 1236916745927790575,
            "orderNum": 100,
            "type": 3,
            "status": 1,
            "createTime": "2020-01-08T07:42:50.000+00:00",
            "updateTime": null,
            "deleted": 1
        },
        {
            "id": 1473855535827783680,
            "code": "",
            "title": "测试-01",
            "icon": "el-icon-user-solid",
            "perms": "",
            "url": null,
            "method": "",
            "name": "test-01",
            "pid": 0,
            "orderNum": 555,
            "type": 1,
            "status": 1,
            "createTime": "2021-12-23T03:18:36.000+00:00",
            "updateTime": "2021-12-23T03:18:36.000+00:00",
            "deleted": 1
        }
        //...............
    ]
}
```

### 3.3 添加权限时回显权限树

#### 1）原型效果

![1644233893500](imgs/1644233893500.png)

#### 2）接口说明

```
功能描述： 添加权限时回显权限树,仅仅显示目录和菜单
服务路径： /api/permissions/tree
服务方法：Get
请求参数：无
```

响应数据格式:

```json
{
    "code": 1,
    "data": [
        {
            "id": 0,
            "title": "顶级菜单",
            "level": 0
        },
        {
            "id": 1236916745927790564,
            "title": "组织管理",
            "level": 1
        },
        {
            "id": 1236916745927790560,
            "title": "菜单权限管理",
            "level": 2
        },
        {
            "id": 1473855535827783680,
            "title": "测试-01",
            "level": 1
        }
        //..................
    ]
}
```



### 3.4 权限添加按钮

#### 1）原型效果

![1644233893500](imgs/1644233893500.png)

#### 2）接口说明

```
功能描述： 权限添加按钮
服务路径： /permission
服务方法：Post
```

请求参数格式:

```json
{
    "type":"1",		//菜单等级 0 顶级目录 1.目录 2 菜单 3 按钮
    "title":"更新角色权限",
    
     /**
     * 对应资源路径
     *  1.如果类型是目录，则url为空
     *  2.如果类型是菜单，则url对应路由地址
     *  3.如果类型是按钮，则url对应是访问接口的地址
     */
    "pid":1236916745927790560,
 
    "url":"api/permissions/tree",//只有菜单类型有名称，默认是路由的名称
    "name":"org",
    "icon":"el-icon-menu",
    "perms":"sys:role:update",//基于springSecrutiry约定的权限过滤便是
    "method":"DELETE",//请求方式：get put delete post等
    "code":"btn-role-update",//vue按钮回显控制辨识
    "orderNum":100//排序
}
```

​	接口提示：请求参数：@RequestBody PermissionAddVo vo

响应数据格式:

```json
{
    "code": 0,
    "msg": "添加成功"
}
```



### 3.5更新权限

#### 1）原型效果

![1644234127208](imgs/1644234127208.png)

#### 2）接口说明

```
功能描述： 更新权限
服务路径： /permission
服务方法：Put
```

请求参数格式:

```json
{
    "id": 1236916745927790556   //权限id
    "type":"1",		//菜单等级 0 顶级目录 1.目录 2 菜单 3 按钮
    "title":"更新角色权限",
    
     /**
     * 对应资源路径
     *  1.如果类型是目录，则url为空
     *  2.如果类型是菜单，则url对应路由地址
     *  3.如果类型是按钮，则url对应是访问接口的地址
     */
    "pid":1236916745927790560,
 
    "url":"api/permissions/tree",//只有菜单类型有名称，默认是路由的名称
    "name":"org",
    "icon":"el-icon-menu",
    "perms":"sys:role:update",//基于springSecrutiry约定的权限过滤便是
    "method":"DELETE",//请求方式：get put delete post等
    "code":"btn-role-update",//vue按钮回显控制辨识
    "orderNum":100//排序
}
```

​	接口提示：请求参数：@RequestBody PermissionUpdateVo vo

响应数据格式:

```json
{
    "code": 0,
    "msg": "添加成功"
}
```

### 3.6 删除权限

#### 1）原型效果

![1644234168465](imgs/1644234168465.png)

#### 2）接口说明

```
功能描述： 删除权限
服务路径： /permission/{permissionId}
服务方法：Delete
```

响应数据格式:

```json
{
    "code": 0,
    "msg": "删除成功"
}
```



