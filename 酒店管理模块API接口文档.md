# 酒店管理模块 API 接口文档

## 目录
- [1. 业务类别管理](#1-业务类别管理)
- [2. 酒店管理](#2-酒店管理)
- [3. 房型管理](#3-房型管理)

---

## 1. 业务类别管理

### 1.1 获取分类详情

- **接口地址**: `GET /api/category/{categoryId}`
- **权限**: `biz:category:query`
- **路径参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| categoryId | Long | 是 | 分类ID |

- **响应示例**:
```json
{
  "code": 200,
  "message": "成功",
  "data": {
    "categoryId": 1,
    "categoryName": "商务酒店",
    "sortOrder": 1,
    "status": "0",
    "statusName": "正常",
    "createTime": "2026-06-10 21:58:33",
    "updateTime": "2026-06-10 21:58:33"
  }
}
```

### 1.2 新增分类

- **接口地址**: `POST /api/category`
- **权限**: `biz:category:add`
- **请求体**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| categoryName | String | 是 | 分类名称 |
| sortOrder | Integer | 是 | 排序 |
| status | String | 是 | 状态（0正常 1停用） |

- **请求示例**:
```json
{
  "categoryName": "商务酒店",
  "sortOrder": 1,
  "status": "0"
}
```

- **响应示例**:
```json
{
  "code": 200,
  "message": "新增成功"
}
```

### 1.3 编辑分类

- **接口地址**: `PUT /api/category`
- **权限**: `biz:category:edit`
- **请求体**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| categoryId | Long | 是 | 分类ID |
| categoryName | String | 否 | 分类名称 |
| sortOrder | Integer | 否 | 排序 |
| status | String | 否 | 状态 |

- **响应示例**:
```json
{
  "code": 200,
  "message": "修改成功"
}
```

### 1.4 删除分类

- **接口地址**: `DELETE /api/category/{categoryId}`
- **权限**: `biz:category:remove`
- **路径参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| categoryId | Long | 是 | 分类ID |

- **响应示例**:
```json
{
  "code": 200,
  "message": "删除成功"
}
```

### 1.5 修改分类状态

- **接口地址**: `PUT /api/category/{categoryId}/status/{status}`
- **权限**: `biz:category:edit`
- **路径参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| categoryId | Long | 是 | 分类ID |
| status | String | 是 | 状态（0正常 1停用） |

- **响应示例**:
```json
{
  "code": 200,
  "message": "状态修改成功"
}
```

### 1.6 查询分类列表

- **接口地址**: `POST /api/category/query`
- **权限**: `biz:category:list`
- **请求体**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| categoryName | String | 否 | 分类名称（模糊查询） |
| status | String | 否 | 状态 |
| currentPage | Integer | 否 | 当前页码（默认1） |
| pageSize | Integer | 否 | 每页大小（默认10） |

- **请求示例**:
```json
{
  "categoryName": "商务",
  "status": "0",
  "currentPage": 1,
  "pageSize": 10
}
```

- **响应示例**:
```json
{
  "code": 200,
  "message": "成功",
  "data": {
    "total": 10,
    "currentPage": 1,
    "pageSize": 10,
    "rows": [
      {
        "categoryId": 1,
        "categoryName": "商务酒店",
        "sortOrder": 1,
        "status": "0",
        "statusName": "正常",
        "createTime": "2026-06-10 21:58:33",
        "updateTime": "2026-06-10 21:58:33"
      }
    ]
  }
}
```

### 1.7 下拉查询分类列表

- **接口地址**: `GET /api/category/select`
- **权限**: 无（公开接口）
- **响应示例**:
```json
{
  "code": 200,
  "message": "成功",
  "data": [
    {
      "categoryId": 1,
      "categoryName": "商务酒店"
    },
    {
      "categoryId": 2,
      "categoryName": "度假酒店"
    }
  ]
}
```

---

## 2. 酒店管理

### 2.1 获取酒店详情

- **接口地址**: `GET /api/hotel/{id}`
- **权限**: `biz:hotel:query`
- **路径参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id | Long | 是 | 酒店ID |

- **响应示例**:
```json
{
  "code": 200,
  "message": "成功",
  "data": {
    "id": 1,
    "name": "北京王府井希尔顿酒店",
    "address": "北京市东城区王府井大街88号",
    "star": 5,
    "score": 4.80,
    "imgUrl": "https://example.com/hotel.jpg",
    "facility": "WiFi,游泳池,健身房,SPA,餐厅",
    "facilityList": ["WiFi", "游泳池", "健身房", "SPA", "餐厅"],
    "businessId": 1001,
    "merchantName": "希尔顿集团",
    "status": "0",
    "statusName": "营业中",
    "minPrice": 699.00,
    "roomList": [
      {
        "id": 1,
        "hotelId": 1,
        "roomType": "豪华大床房",
        "area": "38平米",
        "bedType": "1.8米大床",
        "price": 699.00,
        "stock": 10,
        "status": "0",
        "statusName": "上架"
      }
    ],
    "createTime": "2026-06-10 21:58:33",
    "updateTime": "2026-06-10 21:58:33"
  }
}
```

### 2.2 新增酒店

- **接口地址**: `POST /api/hotel`
- **权限**: `biz:hotel:add`
- **请求体**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| name | String | 是 | 酒店名称 |
| address | String | 是 | 酒店地址 |
| star | Integer | 是 | 星级(1-5) |
| imgUrl | String | 否 | 图片URL |
| facility | String | 否 | 设施（逗号分隔） |
| businessId | Long | 否 | 商户ID |
| status | String | 否 | 状态（默认草稿） |

- **请求示例**:
```json
{
  "name": "北京王府井希尔顿酒店",
  "address": "北京市东城区王府井大街88号",
  "star": 5,
  "facility": "WiFi,游泳池,健身房"
}
```

- **响应示例**:
```json
{
  "code": 200,
  "message": "成功",
  "data": 1
}
```

### 2.3 编辑酒店

- **接口地址**: `PUT /api/hotel`
- **权限**: `biz:hotel:edit`
- **请求体**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id | Long | 是 | 酒店ID |
| name | String | 否 | 酒店名称 |
| address | String | 否 | 酒店地址 |
| star | Integer | 否 | 星级(1-5) |
| 其他字段 | - | 否 | 同新增接口 |

- **响应示例**:
```json
{
  "code": 200,
  "message": "修改成功"
}
```

### 2.4 删除酒店

- **接口地址**: `DELETE /api/hotel/{id}`
- **权限**: `biz:hotel:remove`
- **路径参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id | Long | 是 | 酒店ID |

- **响应示例**:
```json
{
  "code": 200,
  "message": "删除成功"
}
```

### 2.5 修改酒店状态

- **接口地址**: `PUT /api/hotel/{id}/status/{status}`
- **权限**: `biz:hotel:edit`
- **路径参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id | Long | 是 | 酒店ID |
| status | String | 是 | 状态（0营业中 1草稿 2待审核 3已下架 4已冻结） |

- **响应示例**:
```json
{
  "code": 200,
  "message": "状态修改成功"
}
```

### 2.6 提交上架申请

- **接口地址**: `PUT /api/hotel/{id}/submitAudit`
- **权限**: `biz:hotel:edit`
- **路径参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id | Long | 是 | 酒店ID |

- **响应示例**:
```json
{
  "code": 200,
  "message": "上架申请已提交"
}
```

### 2.7 查询酒店列表（后台管理）

- **接口地址**: `POST /api/hotel/query`
- **权限**: `biz:hotel:list`
- **请求体**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| name | String | 否 | 酒店名称（模糊查询） |
| status | String | 否 | 状态 |
| star | Integer | 否 | 星级 |
| businessId | Long | 否 | 商户ID |
| keyword | String | 否 | 关键词（名称/地址） |
| currentPage | Integer | 否 | 当前页码 |
| pageSize | Integer | 否 | 每页大小 |

- **响应示例**:
```json
{
  "code": 200,
  "message": "成功",
  "data": {
    "total": 100,
    "currentPage": 1,
    "pageSize": 10,
    "rows": [
      {
        "id": 1,
        "name": "北京王府井希尔顿酒店",
        "address": "北京市东城区王府井大街88号",
        "star": 5,
        "score": 4.80,
        "imgUrl": "https://example.com/hotel.jpg",
        "status": "0",
        "statusName": "营业中",
        "businessId": 1001,
        "merchantName": "希尔顿集团",
        "roomCount": 5,
        "createTime": "2026-06-10 21:58:33"
      }
    ]
  }
}
```

### 2.8 酒店多维度搜索（前台用户）

- **接口地址**: `POST /api/hotel/search`
- **权限**: 无（公开接口）
- **请求体**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| keyword | String | 否 | 关键词（名称/地址） |
| region | String | 否 | 地区/城市 |
| star | Integer | 否 | 星级(1-5) |
| minScore | BigDecimal | 否 | 最低评分 |
| minPrice | BigDecimal | 否 | 最低价格 |
| maxPrice | BigDecimal | 否 | 最高价格 |
| facility | String | 否 | 设施（模糊匹配） |
| orderBy | String | 否 | 排序字段（score/price/star/createTime） |
| orderDirection | String | 否 | 排序方式（asc/desc） |
| currentPage | Integer | 否 | 当前页码 |
| pageSize | Integer | 否 | 每页大小 |

- **请求示例**:
```json
{
  "keyword": "王府井",
  "star": 5,
  "minPrice": 500,
  "maxPrice": 2000,
  "orderBy": "price",
  "orderDirection": "asc",
  "currentPage": 1,
  "pageSize": 10
}
```

- **响应示例**:
```json
{
  "code": 200,
  "message": "成功",
  "data": {
    "total": 50,
    "currentPage": 1,
    "pageSize": 10,
    "rows": [
      {
        "id": 1,
        "name": "北京王府井希尔顿酒店",
        "address": "北京市东城区王府井大街88号",
        "star": 5,
        "score": 4.80,
        "imgUrl": "https://example.com/hotel.jpg",
        "status": "0",
        "statusName": "营业中",
        "merchantName": "希尔顿集团",
        "roomCount": 5,
        "createTime": "2026-06-10 21:58:33"
      }
    ]
  }
}
```

### 2.9 酒店详情查询

- **接口地址**: `GET /api/hotel/detail/{id}`
- **权限**: 无（公开接口）
- **路径参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id | Long | 是 | 酒店ID |

- **响应示例**: 同 2.1

---

## 3. 房型管理

### 3.1 获取房型详情

- **接口地址**: `GET /api/room/{id}`
- **权限**: `biz:room:query`
- **路径参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id | Long | 是 | 房型ID |

- **响应示例**:
```json
{
  "code": 200,
  "message": "成功",
  "data": {
    "id": 1,
    "hotelId": 1,
    "hotelName": "北京王府井希尔顿酒店",
    "roomType": "豪华大床房",
    "area": "38平米",
    "bedType": "1.8米大床",
    "price": 699.00,
    "stock": 10,
    "status": "0",
    "statusName": "上架",
    "imgUrl": "https://example.com/room.jpg",
    "createTime": "2026-06-10 21:58:48",
    "updateTime": "2026-06-10 21:58:48"
  }
}
```

### 3.2 新增房型

- **接口地址**: `POST /api/room`
- **权限**: `biz:room:add`
- **请求体**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| hotelId | Long | 是 | 酒店ID |
| roomType | String | 是 | 房型名称 |
| area | String | 否 | 面积 |
| bedType | String | 否 | 床型 |
| price | BigDecimal | 是 | 价格（元/晚） |
| stock | Integer | 是 | 库存数量 |
| status | String | 否 | 状态（默认上架） |
| imgUrl | String | 否 | 图片URL |

- **请求示例**:
```json
{
  "hotelId": 1,
  "roomType": "豪华大床房",
  "area": "38平米",
  "bedType": "1.8米大床",
  "price": 699.00,
  "stock": 10
}
```

- **响应示例**:
```json
{
  "code": 200,
  "message": "成功",
  "data": 1
}
```

### 3.3 编辑房型

- **接口地址**: `PUT /api/room`
- **权限**: `biz:room:edit`
- **请求体**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id | Long | 是 | 房型ID |
| 其他字段 | - | 否 | 同新增接口 |

- **响应示例**:
```json
{
  "code": 200,
  "message": "修改成功"
}
```

### 3.4 删除房型

- **接口地址**: `DELETE /api/room/{id}`
- **权限**: `biz:room:remove`
- **路径参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id | Long | 是 | 房型ID |

- **响应示例**:
```json
{
  "code": 200,
  "message": "删除成功"
}
```

### 3.5 房型上下架

- **接口地址**: `PUT /api/room/{id}/status/{status}`
- **权限**: `biz:room:edit`
- **路径参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id | Long | 是 | 房型ID |
| status | String | 是 | 状态（0上架 1下架） |

- **响应示例**:
```json
{
  "code": 200,
  "message": "状态修改成功"
}
```

### 3.6 修改房型价格

- **接口地址**: `PUT /api/room/{id}/price`
- **权限**: `biz:room:edit`
- **路径参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id | Long | 是 | 房型ID |

- **请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| price | BigDecimal | 是 | 新价格（必须大于0） |

- **响应示例**:
```json
{
  "code": 200,
  "message": "价格修改成功"
}
```

### 3.7 修改房型库存

- **接口地址**: `PUT /api/room/{id}/stock`
- **权限**: `biz:room:edit`
- **路径参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id | Long | 是 | 房型ID |

- **请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| stock | Integer | 是 | 新库存（不能小于0） |

- **响应示例**:
```json
{
  "code": 200,
  "message": "库存修改成功"
}
```

### 3.8 批量修改房型库存

- **接口地址**: `PUT /api/room/batchStock`
- **权限**: `biz:room:edit`
- **请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| ids | List<Long> | 是 | 房型ID列表 |
| stock | Integer | 是 | 新库存（不能小于0） |

- **请求示例**:
```
PUT /api/room/batchStock?ids=1,2,3&stock=20
```

- **响应示例**:
```json
{
  "code": 200,
  "message": "批量修改库存成功"
}
```

### 3.9 库存预警查询

- **接口地址**: `GET /api/room/lowStock`
- **权限**: `biz:room:list`
- **请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| threshold | Integer | 否 | 库存阈值（默认5） |
| hotelId | Long | 否 | 酒店ID（可选，筛选特定酒店） |

- **请求示例**:
```
GET /api/room/lowStock?threshold=3&hotelId=1
```

- **响应示例**:
```json
{
  "code": 200,
  "message": "成功",
  "data": [
    {
      "id": 1,
      "hotelId": 1,
      "hotelName": "北京王府井希尔顿酒店",
      "roomType": "豪华大床房",
      "price": 699.00,
      "stock": 2,
      "status": "0",
      "statusName": "上架"
    }
  ]
}
```

### 3.10 查询房型列表

- **接口地址**: `POST /api/room/query`
- **权限**: `biz:room:list`
- **请求体**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| hotelId | Long | 否 | 酒店ID |
| roomType | String | 否 | 房型名称（模糊查询） |
| status | String | 否 | 状态 |
| minPrice | BigDecimal | 否 | 最低价格 |
| maxPrice | BigDecimal | 否 | 最高价格 |
| keyword | String | 否 | 关键词 |
| currentPage | Integer | 否 | 当前页码 |
| pageSize | Integer | 否 | 每页大小 |

- **响应示例**:
```json
{
  "code": 200,
  "message": "成功",
  "data": {
    "total": 30,
    "currentPage": 1,
    "pageSize": 10,
    "rows": [
      {
        "id": 1,
        "hotelId": 1,
        "hotelName": "北京王府井希尔顿酒店",
        "roomType": "豪华大床房",
        "area": "38平米",
        "bedType": "1.8米大床",
        "price": 699.00,
        "stock": 10,
        "status": "0",
        "statusName": "上架",
        "createTime": "2026-06-10 21:58:48"
      }
    ]
  }
}
```

### 3.11 根据酒店ID查房型

- **接口地址**: `GET /api/room/hotel/{hotelId}`
- **权限**: 无（公开接口）
- **路径参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| hotelId | Long | 是 | 酒店ID |

- **响应示例**:
```json
{
  "code": 200,
  "message": "成功",
  "data": [
    {
      "id": 1,
      "hotelId": 1,
      "hotelName": "北京王府井希尔顿酒店",
      "roomType": "豪华大床房",
      "area": "38平米",
      "bedType": "1.8米大床",
      "price": 699.00,
      "stock": 10,
      "status": "0",
      "statusName": "上架"
    },
    {
      "id": 2,
      "hotelId": 1,
      "hotelName": "北京王府井希尔顿酒店",
      "roomType": "行政双床房",
      "area": "42平米",
      "bedType": "2张1.2米单人床",
      "price": 859.00,
      "stock": 8,
      "status": "0",
      "statusName": "上架"
    }
  ]
}
```

---

## 附录

### 状态枚举

#### 酒店状态 (HotelStatusEnum)

| 值 | 说明 |
|----|------|
| 0 | 营业中 |
| 1 | 草稿 |
| 2 | 待审核 |
| 3 | 已下架 |
| 4 | 已冻结 |

#### 房型状态 (RoomStatusEnum)

| 值 | 说明 |
|----|------|
| 0 | 上架 |
| 1 | 下架 |

#### 分类状态 (CategoryStatusEnum)

| 值 | 说明 |
|----|------|
| 0 | 正常 |
| 1 | 停用 |

#### 删除标志 (DelFlagEnum)

| 值 | 说明 |
|----|------|
| 0 | 正常 |
| 2 | 已删除 |

### 通用响应格式

```json
{
  "code": 200,
  "message": "成功",
  "data": {}
}
```

### 错误响应格式

```json
{
  "code": 500,
  "message": "错误信息"
}
```

### 分页请求参数

| 参数名 | 类型 | 默认值 | 说明 |
|--------|------|--------|------|
| currentPage | Integer | 1 | 当前页码 |
| pageSize | Integer | 10 | 每页大小（最大100） |

### 分页响应格式

```json
{
  "total": 100,
  "currentPage": 1,
  "pageSize": 10,
  "rows": []
}
```
