--> WHAT IS Window Functions 
   Perform calculations(e.g. aggregation) on a specific subset of data, without losing the level of details of rows.
  |-----------------------------|---------------------------|
  |       GROUP BY              |        WINDOW             |
  |_____________________________|___________________________|
  |     Simple Aggregations     |      Aggregations         |
  |                             |            +              |
  |                             |      Keep details         |
  |_____________________________|___________________________|                                                       
  |          Simple             |       Advanced            |
  |       Data Analytics        |     Data Analytics        |
  |_____________________________|___________________________|

    
  |-----------------------------|---------------------------|
  |       GROUP BY Functions    |    WINDOW Functions       |  
  |_____________________________|___________________________|
  |            |COUNT()         |            |COUNT()       |
  |            |SUM()           |            |SUM()         |
  |Aggregations|AVG()           |Aggregations|AVG()         |
  |Functions   |MIX()           |Functions   |MIX()         |
  |            |MAX()           |            |MAX()         |
  |____________|________________|____________|______________|                                                       
                                _____________________________
                                |            |ROW_NUMBER()  |
                                |            |RANK()        |
                                |RANK        |DENSE_RANK()  |
                                |Functions   |CUME_DIST()   |
                                |            |PERCENT_RANK()|
                                |            |NTILE(n)      |
                                |____________|______________|
                                _____________________________
                                |            |LEAD()        |
                                |  Value     |LAG()         |
                                |(Analytics) |FIRST_VALUE() |
                                |Functions   |FIRST_VALUe() |
                                |____________|______________|
     /*-----------------------------------------------------------------------------------------------------------*/ 
