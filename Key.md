## Key

- 例子都在`flutter学习`工程的`Test文件夹`里

### StatelessWidget

- ```
  删除之后调用setState，会重新build，重新build出来的新的StatelessWidget会重新生成一个新的随机颜色,所有的颜色都会发现一次变化
  ```

### StatefulWidget（没有key）

```
没有key：
很奇怪的现象，颜色不变化，但是数据向上移动了
因为在删除第一条数据的时候，Widget对应的Element并没有改变
而Element中对应的State引用也没有发生改变；
在更新Widget的时候，Widget使用了没有改变的Element中的State
```

### StatefulWidget（随机key）

```
ValueKey(Random().nextInt(10000)) 随机key 每次删除都会出现随机颜色
因为修改了key之后，Element会强制刷新，那么对应的State也会重新创建
```

### StatefulWidget（指定key）

```
指定key  理想效果
在更新widget的过程中根据key进行了diff算法，
在前后进行对比时，发现222对应的Element和333对应的Element会继续使用，那么就会删除之前111对应的Element，而不是直接删除最后一个Element
```

### Key的分类

#### LocalKey

- 应用于具有相同父`Element`的`Widget`进行比较，也是`diff`算法的核心所在

##### ValueKey

- 以特定的值作为`key`时使用，比如一个字符串、数字等等

##### ObjectKey

- 如果两个学生，他们的名字一样，使用`name`作为他们的`key`就不合适了
- 我们可以创建出一个学生对象，使用对象来作为key

##### UniqueKey

- 如果我们要确保`key`的唯一性，可以使用`UniqueKey`
- 比如我们之前使用随机数来保证`key`的不同，这里我们就可以换成`UniqueKey`

#### GlobalKey

- 通常我们会使用`GlobalKey`某个`Widget`对应的`Widget`或`State`或`Element`
- `GlobalKey`可以帮助我们访问某个`Widget`的信息，包括`Widget`或`State`或`Element`等对象