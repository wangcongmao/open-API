-- 创建库
create database if not exists yuapi;

-- 切换库
use yuapi;

-- 用户表
create table if not exists user
(
    id           bigint auto_increment comment 'id' primary key,
    userName     varchar(256)                           null comment '用户昵称',
    userAccount  varchar(256)                           not null comment '账号',
    userAvatar   varchar(1024)                          null comment '用户头像',
    gender       tinyint                                null comment '性别',
    userRole     varchar(256) default 'user'            not null comment '用户角色：user / admin',
    userPassword varchar(512)                           not null comment '密码',
    createTime   datetime     default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime   datetime     default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete     tinyint      default 0                 not null comment '是否删除',
    constraint uni_userAccount
        unique (userAccount)
) comment '用户';

-- 帖子表
create table if not exists post
(
    id            bigint auto_increment comment 'id' primary key,
    age           int comment '年龄',
    gender        tinyint  default 0                 not null comment '性别（0-男, 1-女）',
    education     varchar(512)                       null comment '学历',
    place         varchar(512)                       null comment '地点',
    job           varchar(512)                       null comment '职业',
    contact       varchar(512)                       null comment '联系方式',
    loveExp       varchar(512)                       null comment '感情经历',
    content       text                               null comment '内容（个人介绍）',
    photo         varchar(1024)                      null comment '照片地址',
    reviewStatus  int      default 0                 not null comment '状态（0-待审核, 1-通过, 2-拒绝）',
    reviewMessage varchar(512)                       null comment '审核信息',
    viewNum       int                                not null default 0 comment '浏览数',
    thumbNum      int                                not null default 0 comment '点赞数',
    userId        bigint                             not null comment '创建用户 id',
    createTime    datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime    datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete      tinyint  default 0                 not null comment '是否删除'
) comment '帖子';


-- 接口信息
use yuapi;

create table if not exists yuapi.`interface_info`
(
    `id` bigint not null auto_increment comment '主键' primary key,
    `name` varchar(256) not null comment '接口名称',
    `description` varchar(256) null comment '描述',
    `url` varchar(512) not null comment '接口地址',
    `requestHeader` text not null comment '请求头',
    `responseHeader` text not null comment '响应头',
    `count` varchar(256) not null comment '用户名',
    `status` int default 0 not null comment '接口状态 0-关闭 1-开启',
    `method` varchar(256) not null comment '请求类型',
    `userId` bigint not null comment '创建人id',
    `isDelete` tinyint default 0 not null comment '是否删除(0-未删, 1-已删)',
    `createTime` datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    `updateTime` datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间'
) comment '接口信息';

insert into yuapi.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `count`, `status`, `method`, `userId`) values ('钟子默', '谭胤祥', 'www.boris-schultz.name', '武文轩', '秦思淼', '卢靖琪', 0, '孟楷瑞', 548301);
insert into yuapi.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `count`, `status`, `method`, `userId`) values ('李懿轩', '邵潇然', 'www.stanford-oberbrunner.co', '顾伟泽', '孙越泽', '唐天磊', 0, '谢鹏煊', 93);
insert into yuapi.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `count`, `status`, `method`, `userId`) values ('任浩轩', '任鹏', 'www.kristopher-mraz.name', '雷烨霖', '张昊然', '白皓轩', 0, '钟雪松', 888614363);
insert into yuapi.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `count`, `status`, `method`, `userId`) values ('史梓晨', '卢耀杰', 'www.louise-nienow.info', '阎天宇', '李子默', '白浩', 0, '谭绍齐', 5);
insert into yuapi.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `count`, `status`, `method`, `userId`) values ('段明杰', '莫子涵', 'www.henry-kihn.net', '阎烨霖', '龙子涵', '罗致远', 0, '范健柏', 48689);
insert into yuapi.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `count`, `status`, `method`, `userId`) values ('洪鸿涛', '雷鹤轩', 'www.daniel-streich.io', '段子骞', '戴煜祺', '唐乐驹', 0, '严振家', 58);
insert into yuapi.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `count`, `status`, `method`, `userId`) values ('丁思淼', '吴立轩', 'www.temeka-king.co', '董瑾瑜', '贺健雄', '谭雨泽', 0, '雷驰', 61);
insert into yuapi.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `count`, `status`, `method`, `userId`) values ('宋煜祺', '梁子默', 'www.traci-boyer.name', '崔修杰', '何烨磊', '孟越彬', 0, '杨彬', 8994251903);
insert into yuapi.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `count`, `status`, `method`, `userId`) values ('何晓啸', '贺炎彬', 'www.vernie-beer.name', '郑昊强', '龙鹤轩', '史展鹏', 0, '雷擎宇', 84782083);
insert into yuapi.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `count`, `status`, `method`, `userId`) values ('沈弘文', '黎健雄', 'www.noma-nolan.co', '王博超', '莫伟泽', '王苑博', 0, '唐烨霖', 4078193090);
insert into yuapi.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `count`, `status`, `method`, `userId`) values ('贾越泽', '尹梓晨', 'www.jaime-emard.io', '贺嘉熙', '冯博涛', '苏建辉', 0, '石致远', 80902);
insert into yuapi.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `count`, `status`, `method`, `userId`) values ('武昊强', '夏展鹏', 'www.glenn-shields.org', '陆志泽', '傅涛', '钱耀杰', 0, '严苑博', 90685707);
insert into yuapi.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `count`, `status`, `method`, `userId`) values ('廖伟诚', '陈金鑫', 'www.daria-kuhn.net', '张梓晨', '吴聪健', '韩雪松', 0, '赖博文', 5480431126);
insert into yuapi.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `count`, `status`, `method`, `userId`) values ('叶锦程', '钟炫明', 'www.shon-waelchi.info', '孔鹏飞', '莫哲瀚', '史晟睿', 0, '傅俊驰', 5734115516);
insert into yuapi.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `count`, `status`, `method`, `userId`) values ('陶思源', '董擎宇', 'www.merri-schamberger.com', '叶鸿煊', '姜文', '赵胤祥', 0, '廖立辉', 697742);
insert into yuapi.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `count`, `status`, `method`, `userId`) values ('姚鸿煊', '罗文博', 'www.doretta-boyle.co', '姚聪健', '邱伟诚', '宋伟泽', 0, '丁煜祺', 259);
insert into yuapi.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `count`, `status`, `method`, `userId`) values ('江驰', '袁烨华', 'www.dee-koepp.org', '胡烨磊', '李鹏', '黄文博', 0, '万鸿煊', 236);
insert into yuapi.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `count`, `status`, `method`, `userId`) values ('韦绍齐', '金展鹏', 'www.kurt-bogan.org', '邵修洁', '夏志泽', '罗语堂', 0, '冯哲瀚', 7729515436);
insert into yuapi.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `count`, `status`, `method`, `userId`) values ('高弘文', '贺立辉', 'www.jacque-rau.org', '赵煜祺', '薛立果', '马苑博', 0, '董绍齐', 471055904);
insert into yuapi.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `count`, `status`, `method`, `userId`) values ('石伟祺', '贺鑫鹏', 'www.ezra-reichert.info', '方峻熙', '薛天磊', '吴博文', 0, '张楷瑞', 9109519);