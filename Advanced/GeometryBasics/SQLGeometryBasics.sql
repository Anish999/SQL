
--------SQL Geometry---------
-----------------------------

SELECT [SpatialData], 
		SpatialData.ToString() As 'SpatialData', 
		SpatialData.AsGml() AS [Spatial text]
FROM [spatial]

  insert into [spatial]([SpatialData])
	 values ('Point(7 12)'),
			('Linestring(0 0, 7 8)'),
			('Polygon((0 0, 8 5, 9 6, 10 0, 0 0))')