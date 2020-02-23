Setup
====

* Requires [MySQL](https://dev.mysql.com/downloads/mysql/) installed. Requires [MySQL](https://dev.mysql.com/downloads/mysql/) installed. Used [DataGrip](https://www.jetbrains.com/datagrip/) mainly & [phpMyAdmin](https://www.phpmyadmin.net/) briefly to view, apply, manipulate. Alternatively [CLI](https://dev.mysql.com/doc/mysql-getting-started/en/) works too.
* Clone, connect, run.
* Voila, data.

Purpose
=======

* Practice data loading, stored procedures. More to come.


Learned
=======

* so much.
* like what?
* umm..
* parsing stuff:
    * remap data formats
    * data hygiene
    * filtered empty rows
<!--
* stored procedure stuff:
    *
-->
* security model stuff:
    * Used `secure_file_priv` to identify safe path to "upload" files into. (wish for easy-multi-platform script to copy to this location too)...


<details><summary>

Technical
=====
</summary>

* parsing stuff:
    * remap data formats (with `SET` on user-defined variables `@var_name`)
    * data hygiene (changed encoding due to emdash incompatibility)
    * filtered empty rows (with temporary staging table and `INSERT..SELECT`)
</details>



Sources
=======
* Data sources acquired from [Kaggle](https://www.kaggle.com/).
* Much expediency and thanks is naturally a given to StackOverflow community, good documentation on MySQL, good clean datasets on Kaggle, and Google's keyword search algorithm.

I just put it all together, standing on the shoulders of these well-versed ahead of me.
