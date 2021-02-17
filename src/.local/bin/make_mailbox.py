#!/usr/bin/env python3
import mailbox
import sys


mailbox_path = sys.argv[1]
mail_paths = sys.argv[2:]
destination = mailbox.MH(mailbox_path)
destination.lock()

for mail_path in mail_paths:
    destination.add(open(mail_path, 'r'))

destination.flush()
destination.unlock()
