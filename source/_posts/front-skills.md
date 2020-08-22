---
title: front skills
date: 2020-08-04 16:39:06
tags:
---
# 实用的前端开发技巧

### 1、函数节流
#### 使用场景
一些频繁触发的函数。

      - window.onsize - 绑定web端窗口大小变化
      - window.onscroll - 绑定滚动条滑动事件
      - bindinput - 微信小程序，绑定文本输入，文本编辑实时保存
      - v-on:input - vue，绑定输入
      - resize - 浏览器窗口大小变化
#### JS实现
```javascript
/**
 * 函数节流(throttle)：函数在一段时间内多次触发只会执行第一次
 * @param  {Object} fn - 请求参数
 * @param  {number} gapTime - 时间（精确到毫秒）默认1秒5
 * @return {Object} 返回一个引用lastTime的闭包函数
 */
export const throttle = (fn, gapTime = 1500) => {
  let lastTime = null
  return function () {
    let nowTime = + new Date()
    if (nowTime - lastTime > gapTime || !lastTime) {
      lastTime = nowTime
      // 将this和参数传给原函数
      fn.apply(this, arguments)
    }
  }
}

/**
 * 方式二：执行最后一次
 */

```
### 
### 2、函数防抖
#### 使用场景


```javascript
/**
 * 函数防抖(debounce)：一定时间段内的连续函数调用，只会执行一次
 * @param  {Object} fn - 执行的函数
 * @param  {number} delay - 时间（精确到毫秒）默认0.5毫秒
 * @return {Object} 返回一个引用timer的闭包函数
 */
export const debounce = (fn, delay = 500) => {
  let timer = null
  return function () {
    if (timer) clearTimeout(timer)
    timer = setTimeout(() => {
      fn.apply(this, arguments)
    }, delay)
  }
}
```
### 
### 3、缓存函数
```javascript
/**
 * 缓存执行过的函数
 * @param  {string} value - 需要校验的字符串
 * @return {boolean} ture为是真，false为假
 */
export const cached = (fn) => {
  var cache = Object.create(null); // 创建一个空对象
  return (function cachedFn(str) { // 获取缓存对象str属性的值，如果该值存在，直接返回，不存在调用一次fn，然后将结果存放到缓存对象中
    var hit = cache[str];
    return hit || (cache[str] = fn(str))
  })
} 
```
### 


### 4、驼峰化字符串
```javascript
const camelizeRE = /-(\w)/g;
/**
 * 驼峰化字符串
 * @param  {string} value - 需要驼峰化的字符串
 * @return {boolean} ture为是真，false为假
 */
const camelize = cached(function (str) {
  return str.replace(camelizeRE, function (_, c) { return c ? c.toUpperCase() : ''; })
})
```


### 5、获取原始类型
```javascript
const _toString = Object.prototype.toString;
/**
 * 获取原始类型
 * @param  {string} value - 需要校验的字符串
 * @return {boolean} ture为是真，false为假
 */
export const toRawType = (value) => {
  return _toString.call(value).slice(8, -1)
}
```





