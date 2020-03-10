Contains an evolving collection of a few independent schemas and queries. Currently composed of two major genres: films in IMDb and employment industries in NAICS.

Setup
====

* Requires [MySQL](https://dev.mysql.com/downloads/mysql/) installed, ideally 8.0.4+ in some cases. 
* Any MySQL tool. I significantly prefer [DataGrip](https://www.jetbrains.com/datagrip/), but [phpMyAdmin](https://www.phpmyadmin.net/), [MySQL Workbench](https://www.mysql.com/products/workbench/) or even the [CLI](https://dev.mysql.com/doc/refman/8.0/en/mysql.html) works too.
* Choose your dataset to work with 
* Films use trakt, netflix, IMDb, and industry codes uses NAICS from each US and Canada sources.
  * If using IMDb download of a few gigabytes of [IMDb datasets here](https://www.imdb.com/interfaces/). I've documented how I overcame data-loading difficulties.
  * All other data are relatively tiny filesizes and included directly in this repository, including North American Industry Classification System from each [Canada](https://www.statcan.gc.ca/eng/subjects/standard/naics/2017/v3/index) and the [United States](https://www.census.gov/eos/www/naics/downloadables/downloadables.html).
* Voilà, querable data.
* Have fun, play, learn.


Purpose
=======

* Practice data loading, stored procedures, splitting and joining comma-separated values into rows, joining multiple tables.


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

Technical (click to expand)
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



Data Sources
=======
* [IMDb datasets here](https://www.imdb.com/interfaces/)
* North American Industry Classification System from each [Canada](https://www.statcan.gc.ca/eng/subjects/standard/naics/2017/v3/index) and the [United States](https://www.census.gov/eos/www/naics/downloadables/downloadables.html)
* [Kaggle](https://www.kaggle.com/) had some scripts Shows/Films:

    * [Game of Thrones](https://www.kaggle.com/albenft/game-of-thrones-script-all-seasons)
    * [Rick and Morty](https://www.kaggle.com/andradaolteanu/rickmorty-scripts)
    * [Kung Fu Panda](https://www.kaggle.com/zusmani/kung-fu-panda)

* Much expediency and thanks is naturally a given to StackOverflow community, good documentation on MySQL, good clean datasets on Kaggle, and Google's keyword search algorithm.

I just put it all together, standing on the shoulders of these well-versed ahead of me.
