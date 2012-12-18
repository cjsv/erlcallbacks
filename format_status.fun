ifdef(NOTDEF, -*- mode: erlang; indent-tabs-mode: nil -*-)dnl
ifdef(<!EV!>,<!%% invoked by
%% (gen_event:format_status/2, gen_event:report_error/5)
%%
%% @doc Standard (optional) gen_event callback. Format the process'
%% dictionary and state for output.
%%
%% *** If you want to use the default function instead of this
%% callback, remove format_status/2 from the -export list above and
%% delete this -spec and function. ***
%%
-spec format_status(Opt :: normal | terminate,
                    [{PDict :: [{Key :: atom(), Value :: term()}],
                      State :: term()}]) ->
                           Status :: term().
format_status(_Opt, [_PDict, State]) ->
    [{data, [{"State", State}]}].
!>)dnl
ifdef(<!FS!>,<!%% invoked by
%% (gen_fsm:format_status/2, gen_fsm:terminate/7)
%%
%% @doc Standard (optional) gen_fsm callback. Format the process'
%% dictionary and state for output.
%%
%% *** If you want to use the default function instead of this
%% callback, remove format_status/2 from the -export list above and
%% delete this -spec and function. ***
%%
-spec format_status(Opt :: normal | terminate,
                    [{PDict :: [{Key :: atom(), Value :: term()}],
                      StateData :: term()}]) ->
                           Status :: term().
format_status(_Opt, [_PDict, StateData]) ->
    [{data, [{"StateData", StateData}]}].
!>)dnl
ifdef(<!SE!>,<!%% invoked by
%% (gen_server:format_status/2, gen_server:terminate/6)
%%
%% @doc Standard (optional) gen_server callback. Format the process'
%% dictionary and state for output.
%%
%% *** If you want to use the default function instead of this
%% callback, remove format_status/2 from the -export list above and
%% delete this -spec and function. ***
%%
-spec format_status(Opt :: normal | terminate,
                    [{PDict :: [{Key :: atom(), Value :: term()}],
                      State :: term()}]) ->
                           Status :: term().
format_status(_Opt, [_PDict, State]) ->
    [{data, [{"State", State}]}].
!>)dnl
