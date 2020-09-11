---
title: Object.create(null)，new Object()，{}的区别
date: 2020-07-11 16:39:33
tags:
---

### 前言
在阅读VUE框架源码的过程中，无意中发现Object.create(null)，为什么作者不使用更便捷的{}对象字面量写法呢？于是有了下面的一场探索。
### 三者的区别
```javascript
let a = Object.create(null)
a.tt = 1
let b = new Object(null)
b.tt = 2
let c = {}
c.tt = 3
console.log(a)
console.log(b)
console.log(c)

// 打印展开如下
{tt: 1}
tt: 1

{tt: 2}
tt: 2
__proto__: Object

{tt: 3}
tt: 3
__proto__: Object
```
### 使用Object.create(null)的原因

1. 通过Object.create(null)创建出来的对象，没有任何属性，显示No properties。我们可以将其当成一个干净的 map 来使用，自主定义 toString,hasOwnProperty等方法，并且不必担心将原型链上的同名方法被覆盖。
1. {...}创建的对象，使用for in遍历对象的时候，会遍历原型链上的属性，带来性能上的损耗。使用Object.create(null)则不必再对其进行遍历了。
