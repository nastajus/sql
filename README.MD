Setup
====

* Requires [MySQL](https://dev.mysql.com/downloads/mysql/) installed. Used [DataGrip](https://www.jetbrains.com/datagrip/) mainly & [phpMyAdmin](https://www.phpmyadmin.net/) briefly to view, apply, manipulate. Alternatively [CLI](https://dev.mysql.com/doc/mysql-getting-started/en/) works too.
* Clone, connect, run.
* Voila, data.

Purpose
=======

* Practice data loading, stored procedures. More to come.


Learned / Did
=======

* so much.
* like what?
* umm..
* parsing stuff:
    * remap data formats
    * data hygiene
    * filtered empty rows
* model stuff:
    * collated comparable data
* security model stuff:
    * Made user-friendly beginning instructions.
* clean code stuff:
    * reloads entirely.
    * reads easily.

<details><summary>

Technical
=====
</summary>

* parsing stuff:
    * remap data formats (with `SET` on user-defined variables `@var_name`)
    * data hygiene (changed encoding due to emdash incompatibility)
    * filtered empty rows (with temporary staging table and `INSERT..SELECT`)
* model stuff:
    * collated comparable data sets by homogenizing id keys
* security model stuff:
    * commented out `secure_file_priv` at very beginning to help user identify safe path to "upload" files into.
        * (wish for easy-multi-platform script to copy to this location too...)
* clean code stuff:
    * reloads entirely by dropping prior to creating, by using temporary staging.
    * reads easily by indenting & commenting appropriately.
</details>



Sources
=======
* Data sources acquired from [Kaggle](https://www.kaggle.com/) scripts Shows/Films:

    * [Game of Thrones](https://www.kaggle.com/albenft/game-of-thrones-script-all-seasons)
    * [Rick and Morty](https://www.kaggle.com/andradaolteanu/rickmorty-scripts)
    * [Kung Fu Panda](https://www.kaggle.com/zusmani/kung-fu-panda)

* Much expediency and thanks is naturally a given to StackOverflow community, good documentation on MySQL, good clean datasets on Kaggle, and Google's keyword search algorithm.

I just put it all together, standing on the shoulders of these well-versed ahead of me.
