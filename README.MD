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

So much. Like :

* parsing stuff:
    * remap data formats
    * data hygiene
    * filtered empty rows
* model stuff:
    * collated comparable data
    * uniformly ingested divergent formats
* project management stuff:
    * user-friendly defaults/clues.
    * limited scope creep.
* clean code stuff:
    * reloads gracefully.
    * reads easily.
    * reused functions.

<details><summary>

Technical
=====
</summary>

Like, justifying my actual statements:

* parsing stuff:
    * remap data formats (with `SET` on user-defined variables `@var_name`)
    * data hygiene (changed encoding due to emdash incompatibility)
    * filtered empty rows (with temporary staging table and `INSERT..SELECT`)
* model stuff:
    * collated comparable data -- by selecting similar data sets, and by homogenizing their id keys, and flattening to per-line statements.
    * uniformly ingested divergent formats -- by flattening relations for each fixed width lined content, delimited CSV content, and JSON (upcoming).
* project management stuff:
    * user friendly defaults by beginning instructions commented out `secure_file_priv` to help new users quickly identify safe path to "upload" files into.
    * limited scope creep by restraining desires to maximize friendliness in short time span...
        * (wish to also write easy-multi-platform script to copy to this location too... but that's waaaay outside scope of this project...)
* clean code stuff:
    * reloads gracefully by dropping prior to creating, by using temporary staging.
    * reads easily by indenting & commenting appropriately.
    * reused functions like `proper_case` for consistent camel case of character names.
</details>



Sources
=======
* Data sources acquired from [Kaggle](https://www.kaggle.com/) scripts Shows/Films:

    * [Game of Thrones](https://www.kaggle.com/albenft/game-of-thrones-script-all-seasons)
    * [Rick and Morty](https://www.kaggle.com/andradaolteanu/rickmorty-scripts)
    * [Kung Fu Panda](https://www.kaggle.com/zusmani/kung-fu-panda)

* Much expediency and thanks is naturally a given to StackOverflow community, good documentation on MySQL, good clean datasets on Kaggle, and Google's keyword search algorithm.

I just put it all together, standing on the shoulders of these well-versed ahead of me.
