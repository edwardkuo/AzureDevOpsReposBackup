# Azure DevOps Service Repos Backup
According Company policy or other issue , we maybe need to backup our code from azure devops to our storage.

# Chinese Ref.
今天要來談談如何備份在Azure DevOps Service上面的Repository。為什麼需要這樣做?既然都用雲端服務，為甚麼還需要把雲端服務的檔案備份呢?主要在有時基於所謂"資安"或是"ISO2XXXX"相關條文就需要做到這一點。當然，另一種就是對於所謂"雲端"抱持的存疑或是其他的不安全關係，必須做到這一點。我想如果今日是使用Azure DevOps Server可能就不會需要這樣子做吧。
不過，既然有這樣需求存在，要去備份Azure DevOps Service上面的Repository也不是不可能。要做到這樣方式也不難，不過，如果靠手工做這件事情，又相當的不先進。因此，我們來透過自動化方式外加使用Azure DevOps Service的Release排程來完成定時備份Azure DevOps Service的Repository
作法依序為下列幾個步驟:
- 取得Azure DevOps 專案內的所有Repository 名稱
- 用Git Clone所有Repository
- 用Git Pull 定期同步所有Repository

[備份Azure DevOps Service 的 Repository 檔案](https://medium.com/ek-technology/%E5%82%99%E4%BB%BDazure-devops-service-%E7%9A%84-repository-%E6%AA%94%E6%A1%88-6d480f968707)
 
