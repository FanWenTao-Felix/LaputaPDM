# [javascript 及 vue 中的变量前面的美元符号 $ 是什么意思](https://www.cnblogs.com/welhzh/p/9902397.html)

### $

您会注意到，我们将库代理为以美元符号“$”为前缀的属性名。 你可能还看过其他的属性和方法，例如，`$refs`, `$on`, `$mount`等等也都是以”$”开头。

虽然属性名上添加前缀不是必须的，但是这样做可以提醒糊涂的开发人员（可能是你），这是一个公共API属性或方法，欢迎你使用，不像其他属性的实例，可能只是为了 Vue 的内部使用。

作为基于原型的语言，Javascript 中没有（真正的）类，因此也没有 “私有” 和 “公共” 变量或 “静态” 方法。 这个惯例是一种很好的替代品，我们认为是值得遵守的约定。

 

## 如何在 Vue.js 项目中 引入 JavaScript 第三方库

### 全局变量

将 JavaScript 第三方库 添加到项目中，最简单的办法是通过将其附加到 `window` 对象上，以使其成为全局变量：

JavaScript 代码:

```
    // entry.js 文件
    window._ = require('lodash');
```

 

JavaScript 代码:

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
    // MyComponent.vue 文件
    export default {
    created() {
    console.log(_.isEmpty() ? 'Lodash everywhere!' : 'Uh oh..');
    }
    }
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

 

这种情况会使 `window` 变量不断增长，但是最关键的是，他们不能使用服务器渲染。当应用程序在服务端运行时，`window` 对象是 `undefined` 的，因此尝试访问 `window` 下的属性将会抛出一个错误。

### 在每个文件中导入

另一种二流的方法是将库导入到每个文件中：

JavaScript 代码:

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
    // MyComponent.vue 文件
    import _ from 'lodash';
    export default {
    created() {
    console.log(_.isEmpty() ? 'Lodash is available here!' : 'Uh oh..');
    }
    }
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

 

这是有效的，但是你需要重复手动导入和移除，这是一个痛点：你必须记住将这个库导入到每个文件中，然后当你的某个文件不用这个库的时候, 记得要将它从这个文件中移除。如果你没有正确地设置你的构建工具，则可能会最终导致在构建包中存在同一个库的多个副本。

### 一个更好的方式

在Vue项目中使用Javascript库的最干净，最健壮的方法是将其代理为 Vue 原型对象的属性。我们用这种方式，将 Moment日期和时间库添加到我们的项目中：

JavaScript 代码:

```
    // entry.js 文件
    import moment from 'moment';
    Object.definePrototype(Vue.prototype, '$moment', { value: moment });
```

 

由于所有组件都会继承 Vue 原型对象上方法，这将使 Moment 自动可用于任何组件，没有全局变量或任何需要手动导入的组件。它可以在任何 实例/组件 中简单地通过 `this.$moment` 访问被访问：

JavaScript 代码:

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
    // MyComponent.vue 文件
    export default {
    created() {
    console.log('The time is ' . this.$moment().format("HH:mm"));
    }
    }
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

 

现在让我们花点时间了解一下这是如何工作的。

### Object.defineProperty

我们通常会像这样设置一个对象属性：

JavaScript 代码:

```
Vue.prototype.$moment = moment;
```

 

你可以这么做，但是通过使用 `Object.defineProperty` ，我们可以使用 [描述符](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty) 来定义我们的属性。描述符允许我们设置一些低级细节，例如我们的属性是否可写，以及在 `for` 循环中枚举期间是否显示。

我们通常不会在日常使用 Javascript 中使用到描述符，因为 99％ 的时间我们不需要这么细致的属性分配。但这里给我们一个明显的优势：默认情况下，使用描述符创建的属性是只读的。

这意味着，一些糊涂的开发人员（可能是你）不能在组件内去做一些很愚蠢的事情, 并且破坏一切.

JavaScript 代码:

```
    this.$http = 'Assign some random thing to the instance method';
    this.$http.get('/'); // TypeError: this.$http.get is not a function
```

 

相反, 我们的只读实例则能很好的保护我们的库, 因为如果有人试图去覆盖它, 将会获得一个错误: `TypeError: Cannot assign to read only property`.

 

### this

你还会注意到，你可以使用 `this.libraryName` 来使用这个库 ，但是这样做会有个小小的问题，因为它现在是一个实例方法。

然而，这样做的结果是，与全局变量不同，您在使用库时必须确保处于正确的作用域中。内部的回调方法不能通过 `this` 来访问你的库。

幸好，ES6中的箭头函数是一个不错的解决方案, 它能确保你在正确的作用域中:

JavaScript 代码:

1. // script.js
2. this.$http.get('/').then(res => {
3. if (res.status !== 200) {
4. this.$http.get('/') // etc
5. // 只在箭头回调函数中起作用。愚人码头注：你也可以使用ES5 的 bind();
6. }
7. });

### 为什么不使它成为一个插件？

如果您打算在多个 Vue 项目中使用 JavaScript 第三方库，或者您想与世界分享你的库，您可以将其构建成插件！

插件提取复杂性的部分，允许你在项目中简单地执行以下操作来添加你选择的库：

JavaScript 代码:

1. // script.js
2. import MyLibraryPlugin from 'my-library-plugin';
3. Vue.use(MyLibraryPlugin);

使用这两行，我们可以在任何组件中使用 JavaScript 第三方库，就像我们可以使用 Vue Router ，Vuex 和其他使用 Vue.use 的插件一样。

### 编写一个插件

首先，为您的插件创建一个文件。在这个例子中，我将创建一个插件，将 Axios 添加到你所有的 Vue 实例和组件中，因此我将调用文件 *axios.js*。

要了解的主要内容是：插件必须公开一个 `install` 方法，并且将 Vue 构造函数作为第一个参数：

JavaScript 代码:

1. // axios.js
2. export default {
3. install: function(Vue) {
4. // Do stuff
5. }
6. }

现在我们可以使用之前介绍的方法将库添加到原型对象中:

JavaScript 代码:

1. // axios.js
2. import axios from 'axios';
3. export default {
4. install: function(Vue,) {
5. Object.defineProperty(Vue.prototype, '$http', { value: axios });
6. }
7. }

我们现在需要做的事情是 `use` 实例方法将我们的库添加到一个项目。例如，我们现在可以轻松地添加 Axios 库：

JavaScript 代码:

1. // entry.js
2. import AxiosPlugin from './axios.js';
3. Vue.use(AxiosPlugin);
4. new Vue({
5. created() {
6. console.log(this.$http ? 'Axios works!' : 'Uh oh..');
7. }
8. })

### 彩蛋: 插件可选参数

你插件里的 `install` 方法允许接受可选参数。 一些开发人员可能不是很喜欢使用 axios 实例的方法名 `$http` ，因为 Vue Resource 已经使用了这个名字，所以让我们使用一个可选参数来让它们变成你所喜欢的方法名：

JavaScript 代码:

1. // axios.js
2. import axios from 'axios';
3. export default {
4. install: function(Vue, name = '$http') {
5. Object.defineProperty(Vue.prototype, name, { value: axios });
6. }
7. }

JavaScript 代码:

1. // entry.js
2. import AxiosPlugin from './axios.js';
3. Vue.use(AxiosPlugin, '$axios');
4. new Vue({
5. created() {
6. console.log(this.$axios ? 'Axios works!' : 'Uh oh..');
7. }
8. })

\-------------------------------------------------------------------------------------------------------------------------------------