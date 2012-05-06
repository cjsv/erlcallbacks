ifdef(NOTDEF, -*-mode:erlang; indent-tabs-mode: nil-*-)dnl
ifdef(<!EV!>,<!%%
%% @doc API suggested in OTP Design Principles User's Guide to start
%% this gen_event process.
%%
-spec start_link() ->
                        {ok, Pid :: pid()} |
                        ignore |
                        {error,
                         Error :: {already_started, Pid :: pid()}.
start_link() ->
    gen_event:start_link({local, ?MODULE}, ?MODULE, [], []).
!>)dnl
ifdef(<!FS!>,<!%%
%% @doc API suggested in OTP Design Principles User's Guide to start
%% this gen_fsm process.
%%
-spec start_link() ->
                        {ok, Pid :: pid()} |
                        ignore |
                        {error,
                         Error :: {already_started, Pid :: pid()} | term()}.
start_link() ->
    gen_fsm:start_link({local, ?MODULE}, ?MODULE, [], []).
!>)dnl
ifdef(<!SE!>,<!%%
%% @doc API suggested in OTP Design Principles User's Guide to start
%% this gen_server process.
%%
-spec start_link() ->
                        {ok, Pid :: pid()} |
                        ignore |
                        {error,
                         Error :: {already_started, Pid :: pid()} | term()}.
start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).
!>)dnl
ifdef(<!SU!>,<!%%
%% @doc API suggested in OTP Design Principles User's Guide to start
%% this supervisor process.
%%
-spec start_link() ->
                        {ok, Pid :: pid()} |
                        ignore |
                        {error,
                         Error :: {already_started, Pid :: pid()} |
                                  shutdown |
                                  term()}.
start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).
!>)dnl
