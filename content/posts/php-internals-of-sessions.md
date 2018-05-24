---
title: "PHP – Internals of SESSIONS"
date: 2018-05-08T20:18:53-05:00
showDate: true
draft: false
tags: ["php","sessions", "technical"]
---

When the session_start is called, PHP is looking for an argument from the client (sent via POST, GET or Cookie) with the name of session.name to retrieve the session ID.

If it finds a valid session ID (there are some syntactical restrictions), it tries to retrieve the session data from the storage (session.save_handler) to store it in $_SESSION.

If it can’t find an ID or the configuration forbids its usage (see session.use_cookies, session.use_only_cookies and session.use_trans_sid), PHP generates a new ID using a hash function (session.hash_function) on data of a source that generates random data (session.entropy_file).

At the end of the runtime, it stores the $_SESSION data in the designated storage.

Will session works, if cookies are disabled?

* NO. In this case, each call to session_start will generate a new ID as it  can’t find the previous ID.