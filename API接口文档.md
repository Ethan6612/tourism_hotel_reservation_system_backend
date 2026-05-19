# 旅游酒店预订系统 API 接口文档

## 基础信息

- **Base URL**: `http://localhost:8080`
- **Content-Type**: `application/json`
- **认证方式**: JWT Token (在请求头中添加 `Authorization: Bearer {token}`)

## 通用响应格式

```json
{
  "code": 200,
  "msg": "操作成功",
  "data": {}
}
```

### 响应码说明
- `200`: 成功
- `500`: 服务器内部错误
- `401`: 未授权
- `403`: 禁止访问

---

## 1. 酒店管理模块

### 1.1 获取酒店详情

**接口地址**: `GET /api/hotel/{id}`

**路径参数**:
| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id | Long | 是 | 酒店ID |

**响应示例**:
```json
{
  "code": 200,
  "msg": "操作成功",
  "data": {
    "id": 1,
    "name": "北京大酒店",
    "address": "北京市朝阳区xxx路xxx号",
    "star": 5,
    "score": 4.8,
    "imgUrl": "http://example.com/hotel1.jpg",
    "facility": "WiFi,停车场,游泳池,健身房",
    "businessId": 100,
    "status": "0",
    "createTime": "2026-05-19 10:00:00",
    "updateTime": "2026-05-19 10:00:00"
  }
}
```

---

### 1.2 新增酒店

**接口地址**: `POST /api/hotel`

**权限**: `hotel:add`

**请求体**:
```json
{
  "name": "北京大酒店",
  "address": "北京市朝阳区xxx路xxx号",
  "star": 5,
  "score": 4.8,
  "imgUrl": "http://example.com/hotel1.jpg",
  "facility": "WiFi,停车场,游泳池,健身房",
  "businessId": 100,
  "status": "0"
}
```

**字段说明**:
| 字段名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| name | String | 是 | 酒店名称 |
| address | String | 是 | 酒店地址 |
| star | Integer | 否 | 酒店星级(1-5) |
| score | BigDecimal | 否 | 酒店评分(0-5) |
| imgUrl | String | 否 | 酒店图片URL |
| facility | String | 否 | 酒店设施 |
| businessId | Long | 否 | 商家ID |
| status | String | 否 | 状态(0正常 1停用)，默认0 |

**响应示例**:
```json
{
  "code": 200,
  "msg": "操作成功",
  "data": null
}
```

---

### 1.3 修改酒店

**接口地址**: `PUT /api/hotel`

**权限**: `hotel:edit`

**请求体**:
```json
{
  "id": 1,
  "name": "北京大酒店(更新)",
  "address": "北京市朝阳区xxx路xxx号",
  "star": 5,
  "score": 4.9,
  "imgUrl": "http://example.com/hotel1_new.jpg",
  "facility": "WiFi,停车场,游泳池,健身房,SPA",
  "businessId": 100,
  "status": "0"
}
```

**响应示例**:
```json
{
  "code": 200,
  "msg": "操作成功",
  "data": null
}
```

---

### 1.4 删除酒店

**接口地址**: `DELETE /api/hotel/{id}`

**权限**: `hotel:remove`

**路径参数**:
| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id | Long | 是 | 酒店ID |

**响应示例**:
```json
{
  "code": 200,
  "msg": "操作成功",
  "data": null
}
```

---

### 1.5 查询酒店列表

**接口地址**: `GET /api/hotel/list`

**查询参数**:
| 参数名 | 类型 | 必填 | 默认值 | 说明 |
|--------|------|------|--------|------|
| pageNum | Integer | 否 | 1 | 页码 |
| pageSize | Integer | 否 | 10 | 每页数量 |
| name | String | 否 | - | 酒店名称(模糊查询) |
| star | Integer | 否 | - | 酒店星级 |
| status | String | 否 | - | 状态(0正常 1停用) |

**响应示例**:
```json
{
  "code": 200,
  "msg": "操作成功",
  "data": {
    "total": 100,
    "rows": [
      {
        "id": 1,
        "name": "北京大酒店",
        "address": "北京市朝阳区xxx路xxx号",
        "star": 5,
        "score": 4.8,
        "imgUrl": "http://example.com/hotel1.jpg",
        "facility": "WiFi,停车场,游泳池,健身房",
        "businessId": 100,
        "status": "0",
        "createTime": "2026-05-19 10:00:00",
        "updateTime": "2026-05-19 10:00:00"
      }
    ]
  }
}
```

---

## 2. 房源管理模块

### 2.1 获取房源详情

**接口地址**: `GET /api/room/{id}`

**路径参数**:
| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id | Long | 是 | 房源ID |

**响应示例**:
```json
{
  "code": 200,
  "msg": "操作成功",
  "data": {
    "id": 1,
    "hotelId": 1,
    "roomType": "豪华大床房",
    "area": "35平米",
    "bedType": "1.8米大床",
    "price": 599.00,
    "stock": 10,
    "status": "0",
    "imgUrl": "http://example.com/room1.jpg",
    "createTime": "2026-05-19 10:00:00",
    "updateTime": "2026-05-19 10:00:00"
  }
}
```

---

### 2.2 新增房源

**接口地址**: `POST /api/room`

**权限**: `room:add`

**请求体**:
```json
{
  "hotelId": 1,
  "roomType": "豪华大床房",
  "area": "35平米",
  "bedType": "1.8米大床",
  "price": 599.00,
  "stock": 10,
  "status": "0",
  "imgUrl": "http://example.com/room1.jpg"
}
```

**字段说明**:
| 字段名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| hotelId | Long | 是 | 酒店ID |
| roomType | String | 是 | 房型名称 |
| area | String | 否 | 房间面积 |
| bedType | String | 否 | 床型 |
| price | BigDecimal | 是 | 价格 |
| stock | Integer | 是 | 库存数量 |
| status | String | 否 | 状态(0正常 1停用)，默认0 |
| imgUrl | String | 否 | 图片URL |

**响应示例**:
```json
{
  "code": 200,
  "msg": "操作成功",
  "data": null
}
```

---

### 2.3 修改房源

**接口地址**: `PUT /api/room`

**权限**: `room:edit`

**请求体**:
```json
{
  "id": 1,
  "hotelId": 1,
  "roomType": "豪华大床房(更新)",
  "area": "40平米",
  "bedType": "2米大床",
  "price": 699.00,
  "stock": 8,
  "status": "0",
  "imgUrl": "http://example.com/room1_new.jpg"
}
```

**响应示例**:
```json
{
  "code": 200,
  "msg": "操作成功",
  "data": null
}
```

---

### 2.4 删除房源

**接口地址**: `DELETE /api/room/{id}`

**权限**: `room:remove`

**路径参数**:
| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id | Long | 是 | 房源ID |

**响应示例**:
```json
{
  "code": 200,
  "msg": "操作成功",
  "data": null
}
```

---

### 2.5 查询房源列表

**接口地址**: `GET /api/room/list`

**查询参数**:
| 参数名 | 类型 | 必填 | 默认值 | 说明 |
|--------|------|------|--------|------|
| pageNum | Integer | 否 | 1 | 页码 |
| pageSize | Integer | 否 | 10 | 每页数量 |
| hotelId | Long | 否 | - | 酒店ID |
| status | String | 否 | - | 状态(0正常 1停用) |

**响应示例**:
```json
{
  "code": 200,
  "msg": "操作成功",
  "data": {
    "total": 50,
    "rows": [
      {
        "id": 1,
        "hotelId": 1,
        "roomType": "豪华大床房",
        "area": "35平米",
        "bedType": "1.8米大床",
        "price": 599.00,
        "stock": 10,
        "status": "0",
        "imgUrl": "http://example.com/room1.jpg",
        "createTime": "2026-05-19 10:00:00",
        "updateTime": "2026-05-19 10:00:00"
      }
    ]
  }
}
```

---

## 3. 订单管理模块

### 3.1 获取订单详情

**接口地址**: `GET /api/order/{id}`

**路径参数**:
| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id | Long | 是 | 订单ID |

**响应示例**:
```json
{
  "code": 200,
  "msg": "操作成功",
  "data": {
    "id": 1,
    "orderNo": "ORD1A2B3C4D5E6F7G8H9",
    "userId": 1001,
    "hotelId": 1,
    "roomId": 1,
    "startDate": "2026-05-20",
    "endDate": "2026-05-22",
    "totalPrice": 1198.00,
    "status": "0",
    "payTime": null,
    "createTime": "2026-05-19 10:00:00",
    "updateTime": "2026-05-19 10:00:00"
  }
}
```

---

### 3.2 创建订单

**接口地址**: `POST /api/order`

**请求体**:
```json
{
  "userId": 1001,
  "hotelId": 1,
  "roomId": 1,
  "startDate": "2026-05-20",
  "endDate": "2026-05-22",
  "totalPrice": 1198.00
}
```

**字段说明**:
| 字段名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| userId | Long | 是 | 用户ID |
| hotelId | Long | 是 | 酒店ID |
| roomId | Long | 是 | 房型ID |
| startDate | Date | 是 | 入住日期(yyyy-MM-dd) |
| endDate | Date | 是 | 离店日期(yyyy-MM-dd) |
| totalPrice | BigDecimal | 是 | 总价格 |

**响应示例**:
```json
{
  "code": 200,
  "msg": "操作成功",
  "data": 1
}
```

---

### 3.3 更新订单状态

**接口地址**: `PUT /api/order/{id}/status`

**权限**: `order:edit`

**路径参数**:
| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id | Long | 是 | 订单ID |

**查询参数**:
| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| status | String | 是 | 订单状态(0待支付 1已支付 2已取消 3已完成 4退款中 5已退款) |

**响应示例**:
```json
{
  "code": 200,
  "msg": "操作成功",
  "data": null
}
```

---

### 3.4 查询订单列表

**接口地址**: `GET /api/order/list`

**查询参数**:
| 参数名 | 类型 | 必填 | 默认值 | 说明 |
|--------|------|------|--------|------|
| pageNum | Integer | 否 | 1 | 页码 |
| pageSize | Integer | 否 | 10 | 每页数量 |
| userId | Long | 否 | - | 用户ID |
| status | String | 否 | - | 订单状态 |

**响应示例**:
```json
{
  "code": 200,
  "msg": "操作成功",
  "data": {
    "total": 100,
    "rows": [
      {
        "id": 1,
        "orderNo": "ORD1A2B3C4D5E6F7G8H9",
        "userId": 1001,
        "hotelId": 1,
        "roomId": 1,
        "startDate": "2026-05-20",
        "endDate": "2026-05-22",
        "totalPrice": 1198.00,
        "status": "0",
        "payTime": null,
        "createTime": "2026-05-19 10:00:00",
        "updateTime": "2026-05-19 10:00:00"
      }
    ]
  }
}
```

---

## 4. 评价管理模块

### 4.1 获取评价详情

**接口地址**: `GET /api/comment/{id}`

**路径参数**:
| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id | Long | 是 | 评价ID |

**响应示例**:
```json
{
  "code": 200,
  "msg": "操作成功",
  "data": {
    "id": 1,
    "userId": 1001,
    "hotelId": 1,
    "roomId": 1,
    "score": 5,
    "content": "酒店非常好，服务周到，环境舒适！",
    "imgUrl": "http://example.com/comment1.jpg",
    "createTime": "2026-05-19 10:00:00",
    "replyContent": "感谢您的好评，期待您的再次光临！",
    "replyTime": "2026-05-19 11:00:00"
  }
}
```

---

### 4.2 添加评价

**接口地址**: `POST /api/comment`

**请求体**:
```json
{
  "userId": 1001,
  "hotelId": 1,
  "roomId": 1,
  "score": 5,
  "content": "酒店非常好，服务周到，环境舒适！",
  "imgUrl": "http://example.com/comment1.jpg"
}
```

**字段说明**:
| 字段名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| userId | Long | 是 | 用户ID |
| hotelId | Long | 是 | 酒店ID |
| roomId | Long | 否 | 房型ID |
| score | Integer | 是 | 评分(1-5星) |
| content | String | 是 | 评价内容 |
| imgUrl | String | 否 | 图片URL |

**响应示例**:
```json
{
  "code": 200,
  "msg": "操作成功",
  "data": null
}
```

---

### 4.3 回复评价

**接口地址**: `PUT /api/comment/{id}/reply`

**权限**: `comment:reply`

**路径参数**:
| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id | Long | 是 | 评价ID |

**查询参数**:
| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| replyContent | String | 是 | 回复内容 |

**响应示例**:
```json
{
  "code": 200,
  "msg": "操作成功",
  "data": null
}
```

---

### 4.4 查询评价列表

**接口地址**: `GET /api/comment/list`

**查询参数**:
| 参数名 | 类型 | 必填 | 默认值 | 说明 |
|--------|------|------|--------|------|
| pageNum | Integer | 否 | 1 | 页码 |
| pageSize | Integer | 否 | 10 | 每页数量 |
| hotelId | Long | 否 | - | 酒店ID |
| roomId | Long | 否 | - | 房型ID |

**响应示例**:
```json
{
  "code": 200,
  "msg": "操作成功",
  "data": {
    "total": 200,
    "rows": [
      {
        "id": 1,
        "userId": 1001,
        "hotelId": 1,
        "roomId": 1,
        "score": 5,
        "content": "酒店非常好，服务周到，环境舒适！",
        "imgUrl": "http://example.com/comment1.jpg",
        "createTime": "2026-05-19 10:00:00",
        "replyContent": "感谢您的好评，期待您的再次光临！",
        "replyTime": "2026-05-19 11:00:00"
      }
    ]
  }
}
```

---

## 5. 支付管理模块

### 5.1 查询支付列表

**接口地址**: `GET /api/payment/list`

**查询参数**:
| 参数名 | 类型 | 必填 | 默认值 | 说明 |
|--------|------|------|--------|------|
| pageNum | Integer | 否 | 1 | 页码 |
| pageSize | Integer | 否 | 10 | 每页数量 |
| orderId | Long | 否 | - | 订单ID |
| payStatus | String | 否 | - | 支付状态 |

**响应示例**:
```json
{
  "code": 200,
  "msg": "操作成功",
  "data": {
    "total": 50,
    "rows": [
      {
        "id": 1,
        "orderId": 1,
        "payAmount": 1198.00,
        "payType": "1",
        "payStatus": "0",
        "payTime": null,
        "transactionId": null,
        "createTime": "2026-05-19 10:00:00",
        "updateTime": "2026-05-19 10:00:00"
      }
    ]
  }
}
```

---

### 5.2 获取支付详情

**接口地址**: `GET /api/payment/{id}`

**路径参数**:
| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id | Long | 是 | 支付ID |

**响应示例**:
```json
{
  "code": 200,
  "msg": "操作成功",
  "data": {
    "id": 1,
    "orderId": 1,
    "payAmount": 1198.00,
    "payType": "1",
    "payStatus": "0",
    "payTime": null,
    "transactionId": null,
    "createTime": "2026-05-19 10:00:00",
    "updateTime": "2026-05-19 10:00:00"
  }
}
```

---

### 5.3 创建支付记录

**接口地址**: `POST /api/payment`

**请求体**:
```json
{
  "orderId": 1,
  "payAmount": 1198.00,
  "payType": "1"
}
```

**字段说明**:
| 字段名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| orderId | Long | 是 | 订单ID |
| payAmount | BigDecimal | 是 | 支付金额 |
| payType | String | 否 | 支付类型(1微信 2支付宝 3银行卡) |

**响应示例**:
```json
{
  "code": 200,
  "msg": "操作成功",
  "data": 1
}
```

---

### 5.4 更新支付状态

**接口地址**: `PUT /api/payment/{id}/status`

**权限**: `payment:edit`

**路径参数**:
| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id | Long | 是 | 支付ID |

**查询参数**:
| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| status | String | 是 | 支付状态(0待支付 1已支付 2支付失败 3退款中 4已退款) |
| transactionId | String | 否 | 交易号 |

**响应示例**:
```json
{
  "code": 200,
  "msg": "操作成功",
  "data": null
}
```

---

## 附录

### 订单状态说明
- `0`: 待支付
- `1`: 已支付
- `2`: 已取消
- `3`: 已完成
- `4`: 退款中
- `5`: 已退款

### 支付状态说明
- `0`: 待支付
- `1`: 已支付
- `2`: 支付失败
- `3`: 退款中
- `4`: 已退款

### 支付类型说明
- `1`: 微信支付
- `2`: 支付宝
- `3`: 银行卡

### 酒店/房源状态说明
- `0`: 正常
- `1`: 停用

---

## 注意事项

1. 所有需要权限的接口都需要在请求头中携带有效的JWT Token
2. 日期格式统一为 `yyyy-MM-dd` 或 `yyyy-MM-dd HH:mm:ss`
3. 金额单位为元，保留两位小数
4. 分页查询返回的数据结构包含 `total`(总数) 和 `rows`(数据列表)
5. 创建订单时会自动生成订单号，无需手动传入
6. 评价评分范围为1-5星
