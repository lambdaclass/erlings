-module(poolie_test).

-include_lib("eunit/include/eunit.hrl").

poolie_worker_sup_test() ->
    WorkerCount = worker_count(poolie_worker_sup),

    %% Add 5 workers
    WorkerList = poolie_worker_sup:add_workers(5),
    ?assertEqual(length(WorkerList), 5),

    NewWorkerCount = worker_count(poolie_worker_sup),
    ?assertEqual(NewWorkerCount, WorkerCount + 5).

%% Helper functions

worker_count(Sup) ->
    WorkerSup = supervisor:count_children(Sup),
    {workers, WorkerCount} = proplists:lookup(workers, WorkerSup),
    WorkerCount.
