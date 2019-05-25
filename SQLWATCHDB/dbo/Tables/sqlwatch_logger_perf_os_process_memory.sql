﻿CREATE TABLE [dbo].[sqlwatch_logger_perf_os_process_memory]
(
	[snapshot_time] [datetime] NOT NULL,
	[physical_memory_in_use_kb] [bigint] NOT NULL,
	[large_page_allocations_kb] [bigint] NOT NULL,
	[locked_page_allocations_kb] [bigint] NOT NULL,
	[total_virtual_address_space_kb] [bigint] NOT NULL,
	[virtual_address_space_reserved_kb] [bigint] NOT NULL,
	[virtual_address_space_committed_kb] [bigint] NOT NULL,
	[virtual_address_space_available_kb] [bigint] NOT NULL,
	[page_fault_count] [bigint] NOT NULL,
	[memory_utilization_percentage] [int] NOT NULL,
	[available_commit_limit_kb] [bigint] NOT NULL,
	[process_physical_memory_low] [bit] NOT NULL,
	[process_virtual_memory_low] [bit] NOT NULL,
	[snapshot_type_id] tinyint not null default 1 ,
	[sql_instance] nvarchar(25) not null default @@SERVERNAME,
	constraint fk_sql_perf_mon_os_process_memory_snapshot_header foreign key ([snapshot_time],[snapshot_type_id],[sql_instance]) references [dbo].[sqlwatch_logger_snapshot_header]([snapshot_time],[snapshot_type_id],[sql_instance]) on delete cascade ,
	constraint pk_sql_perf_mon_os_process_memory primary key clustered (
		[snapshot_time] ASC, [sql_instance]
	)
) 
GO
