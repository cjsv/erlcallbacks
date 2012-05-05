ifdef(<!AP!>,<!%% invoked by
%% application:start
%% (application_master:start_it_old,application_master:start_supervisor)
%%
%% @doc Standard application callback. Start the application's supervisor.
%%
-spec start(StartType :: normal |
                         {takeover, Node :: node()} |
                         {failover, Node :: node()},
            StartArgs :: term()) ->
                   {ok, pid()} |
                   {ok, pid(), State :: term()} |
                   {error, Reason :: term()}.
start(_StartType, _StartArgs) ->
    sup:start_link().
!>)dnl
