GO
IF not exists (select *
 from sys.schemas
 WHERE name = N'stg'
 )
 exec('Create Schema [stg]')
GO
GO
IF not exists (select *
 from sys.schemas
 WHERE name = N'dim'
 )
 exec('Create Schema [dim]')
GO

IF not exists (select *
 from sys.schemas
 WHERE name = N'f'
 )
 exec('Create Schema [f]')
GO

IF not exists (select *
 from sys.schemas
 WHERE name = N'rpt'
 )
 exec('Create Schema [rpt]')

 GO

IF not exists (select *
 from sys.schemas
 WHERE name = N'err'
 )
 exec('Create Schema [err]')

 GO
 IF not exists (select *
 from sys.schemas
 WHERE name = N'vw'
 )
 exec('Create Schema [vw]')


