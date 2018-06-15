# myemacs
> 看一句话，说使用了emacs后，要有一种信念，就是要相信有来生。

## 0x00 

算是记录自己使用emacs的过程。当然，也是第一次用github进行管理。

也是第一次用github进行管理,所以很多东西都不熟练，在此做为一个简要说明

1. 如果是新创建的项目

```
echo "# myemacs" >> README.md

git init

git add README.md

git commit -m "first commit"

git remote add origin https://github.com/guobingyi/myemacs.git

git push -u origin master

```

2. 如果是已经创建好的项目

```
git remote add origin https://github.com/guobingyi/myemacs.git

git push -u origin master
```


3. 删除文件

```
git rm --cached .DS_Store
```



4. 提交文件

```
git commit -m 'some file remove'
```



5. 更新到github服务器

```
git push -u origin master
```

6. 与svn的差异

使用过svn的都是commit -m 'xxx'，文件就会将更新项提交了，但是git需要先add一下，在commit。


setp 1

```
git add README.rd
```

setp 2

```
git push -u origin master
```

