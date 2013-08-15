open Lwt
open OS

let heads1 () =
  bind (join [
    bind (Time.sleep 1.0) (fun () ->
      print_endline "Heads"; return ()
    );
    bind (Time.sleep 2.0) (fun () ->
      print_endline "Tails"; return ()
    );
  ]) (fun () ->
    print_endline ("Finished"); return ()
  )

let heads2 () =
  join [
    (Time.sleep 1.0 >>= fun () -> (Console.log "Heads"; return ()));
    (Time.sleep 2.0 >>= fun () -> (Console.log "Tails"; return ()));
  ] >>= (fun () ->
    Console.log "Finished";
    return ()
  )
