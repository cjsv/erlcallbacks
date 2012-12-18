ifdef(NOTDEF, -*- mode: erlang; indent-tabs-mode: nil -*-)dnl
ifdef(<!EV!>,<!%% invoked by
%% gen_event:delete_handler/3, gen_event:stop/1
%% gen_event:swap_handler/3, gen_event:swap_sup_handler/3
%% (gen_event:do_terminate/7)
%%
%% @doc Standard gen_event callback. Clean up State before stopping.
%%
-spec terminate(Args :: term() |
                        {stop, Reason :: term()} |
                        stop |
                        remove_handler |
                        {error, {'EXIT', Reason :: term()}} |
                        {error, term()},
                State :: term()) ->
                       Ignored :: term().
terminate(_Args, _State) ->
    ok.
!>)dnl
ifdef(<!FS!>,<!%% invoked by
%% (gen_fsm:terminate/7)
%%
%% @doc Standard gen_fsm callback. Clean up State before stopping.
%%
-spec terminate(Reason :: normal | shutdown | {shutdown, term()} | term(),
                StateName :: atom(),
                StateData :: term()) ->
                       Ignored :: term().
terminate(_Reason, _StateName, _State) ->
    ok.
!>)dnl
ifdef(<!SE!>,<!%% invoked by
%% (gen_server:terminate/6)
%%
%% @doc Standard gen_server callback. Clean up State before stopping.
%%
-spec terminate(Reason :: normal | shutdown | {shutdown, term()} | term(),
                State :: term()) ->
                       Ignored :: term().
terminate(_Reason, _State) ->
    ok.
!>)dnl
ifdef(<!SB!>,<!%% invoked by
%% (supervisor_bridge:terminate_pid/2)
%%
%% @doc Standard supervisor_bridge callback. Clean up State before stopping.
%%
-spec terminate(Reason :: shutdown | term(),
                State :: term()) ->
                       Ignored :: term().
terminate(_Reason, _State) ->
    ok.
!>)dnl
