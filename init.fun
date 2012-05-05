ifdef(<!EV!>,<!%% invoked by
%% gen_event:add_handler, gen_event:add_sup_handler
%% gen_event:swap_handler, gen_event:swap_sup_handler
%% (gen_event:server_add_handler, gen_event:do_swap)
%%
%% @doc Standard gen_event callback. Initial State for the gen_event
%% server process.
%%
-spec init(InitArgs :: term()) ->
                  {ok, State :: term()} |
                  {ok, State :: term(), hibernate} |
                  {error, Reason :: term()}.
init(_Args) ->
    {ok, nostate}.
!>)dnl
ifdef(<!FS!>,<!%% invoked by
%% gen_fsm:start_link, gen_fsm:start
%% (gen_fsm:init_it)
%%
%% @doc Standard gen_fsm callback. Initial State for the gen_fsm
%% server process.
%%
-spec init(Args :: term()) ->
                  {ok, StateName :: atom(), StateData :: term()} |
                  {ok,
                   StateName :: atom(),
                   StateData :: term(),
                   timeout() | hibernate} |
                  {stop, Reason :: term()} | ignore.
init(_Args) ->
    ignore.
!>)dnl
ifdef(<!SE!>,<!%% invoked by
%% gen_server:start_link, gen_server:start
%% (gen_server:init_it)
%%
%% @doc Standard gen_server callback. Initial state for the gen_server
%% server process.
%%
-spec init(Args :: term()) ->
                  {ok, State :: term()} |
                  {ok, State :: term(), timeout() | hibernate} |
                  {stop, Reason :: term()} |
                  ignore.
init(Args) ->
    {ok, Args}.
!>)dnl
ifdef(<!SU!>,<!%% invoked by
%% supervisor:start_link
%% (supervisor:init,supervisor:code_change)
%%
%% @doc Standard supervisor callback. Specify the child processes to
%% supervise.
%%
-spec init(Args :: term()) ->
                  {ok, {{RestartStrategy :: strategy(),
                         MaxR :: non_neg_integer(),
                         MaxT :: non_neg_integer()},
                        [ChildSpec :: child_spec()]}} |
                  ignore.
init(_Args) ->
    {ok, {{one_for_one, 5, 10}, []}}.
!>)dnl
ifdef(<!SB!>,<!%% invoked by
%% supervisor_bridge:start_link
%% (supervisor_bridge:init)
%%
%% @doc Standard supervisor_bridge callback. Initial state for the
%% supervisor_bridge server process.
%%
-spec init(Args :: term()) ->
                  {ok, Pid :: pid(), State :: term()} |
                  ignore |
                  {error, Error :: term()}.
init(_Args) ->
    ignore.
!>)dnl
