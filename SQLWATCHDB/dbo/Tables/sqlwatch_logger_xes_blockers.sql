﻿CREATE TABLE [dbo].[sqlwatch_logger_xes_blockers]
(
	[attach_activity_id] uniqueidentifier not null,
	[attach_activity_sequence] int not null,
	[blocking_start_time] datetime not null,
	[blocking_end_time] datetime not null,
	[blocked_ecid] int,
	[blocked_spid] int,
	[blocked_sql] nvarchar(max),
	[database_name] sysname,
	[lock_mode] varchar(128),
	[blocking_ecid] int,
	[blocking_spid] int,
	[blocking_sql] nvarchar(max),
	[blocking_duration_ms] int,
	[blocking_client_app_name] sysname,
	[blocking_client_hostname] sysname,
	[report_xml] xml,
	[snapshot_time] datetime,
	[snapshot_type_id] tinyint,
	[sql_instance] nvarchar(25) not null default @@SERVERNAME,
	constraint fk_logger_perf_xes_blockers foreign key ([snapshot_time],[snapshot_type_id],[sql_instance]) references [dbo].[sqlwatch_logger_snapshot_header]([snapshot_time],[snapshot_type_id],[sql_instance]) on delete cascade ,
	constraint pk_logger_perf_xes_blockers primary key clustered (
		[snapshot_time] ASC, [attach_activity_id], [attach_activity_sequence], [sql_instance]
	)
)
