package com.shf.stock.common.enums;

public enum ResponseCode{
    ERROR(0,"操作失败"),
    SUCCESS(1,"操作成功"),
    DATA_ERROR(0,"参数异常"),
    NO_RESPONSE_DATA(0,"无响应数据"),
    SYSTEM_VERIFY_CODE_NOT_EMPTY(0,"验证码不能为空"),
    SYSTEM_VERIFY_CODE_ERROR(0,"验证码错误"),
    SYSTEM_USERNAME_NOT_EMPTY(0,"账号不能为空"),
    SYSTEM_USERNAME_NOT_EXISTS(0,"账号不存在"),
    SYSTEM_USERNAME_EXPIRED(0,"账户过期"),
    SYSTEM_USERNAME_LOCKED(0,"账户被锁"),
    SYSTEM_USERNAME_DISABLED(0,"账户被禁用"),
    SYSTEM_PASSWORD_ERROR(0,"账号或密码错误"),
    SYSTEM_PASSWORD_EXPIRED(0,"密码过期"),
    SYSTEM_USERNAME_OFFLINE(0,"已下线，请重新登录"),
    SYSTEM_ERROR(0,"系统异常请稍后再试"),
    ACCOUNT_EXISTS_ERROR(0,"该账号已存在"),
    TOKEN_ERROR(2,"用户未登录，请先登录"),
    NOT_PERMISSION(3,"没有权限访问该资源"),
    TOKEN_NOT_NULL(-1,"token 不能为空"),
    TOKEN_NO_AVAIL(-1,"token无效或过期"),
    TOKEN_PAST_DUE(-1,"登录失效,请重新登录"),
    TOKEN_EXISTS(-1,"账号异地登录，你已被迫退出"),
    OPERATION_MENU_PERMISSION_CATALOG_ERROR(0,"操作后的菜单类型是目录，所属菜单必须为默认顶级菜单或者目录"),
    OPERATION_MENU_PERMISSION_MENU_ERROR(0,"操作后的菜单类型是菜单，所属菜单必须为目录类型"),
    OPERATION_MENU_PERMISSION_BTN_ERROR(0,"操作后的菜单类型是按钮，所属菜单必须为菜单类型"),
    OPERATION_MENU_PERMISSION_URL_NOT_NULL(0,"菜单权限的url不能为空"),
    OPERATION_MENU_PERMISSION_URL_PERMS_NULL(0,"菜单权限的标识符不能为空"),
    OPERATION_MENU_PERMISSION_URL_METHOD_NULL(0,"菜单权限的请求方式不能为空"),
    OPERATION_MENU_PERMISSION_URL_CODE_NULL(0,"菜单权限的按钮标识不能为空"),
    OPERATION_MENU_PERMISSION_UPDATE(0,"操作的菜单权限存在子集关联不允许变更"),
    ROLE_PERMISSION_RELATION(0, "该菜单权限存在子集关联，不允许删除"),
    OLD_PASSWORD_ERROR(0,"旧密码不匹配");
    private int code;
    private String message;

    ResponseCode(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return 0;
    }

    public String getMessage() {
        return null;
    }
}