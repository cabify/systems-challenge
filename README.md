# Systems Technical Challenge

## Background

Cabify is running an application under a load balancer and we would like to
provide High Availability for this application. Since the application is
stateless we have decided to run more than one instance of it.

We believe that putting the application inside a Docker container will be
helpful in order to run more than one instance on the same host. Then Consul
will help you with service discovery.

For this purpose we have left an Ansible repo with multiple roles. The
repository will automatically provision a Vagrant box with all the necessary
tools to start the work (see the First Steps sections below).

## First Steps

Clone this repositoy into your local machine: `git clone git@github.com:cabify/systems-challenge.git`

Then ensure that you have:
[Vagrant installed](https://www.vagrantup.com/downloads.html).

```bash
❯ vagrant --version
Vagrant 1.9.2
```

[Virtualbox installed](https://www.virtualbox.org/wiki/Downloads)

```bash
❯ VirtualBox --help
Oracle VM VirtualBox Manager 5.2.6
(C) 2005-2018 Oracle Corporation
All rights reserved.
```

Now you should be able to run `vagrant up`.

```bash
❯ vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Importing base box 'ubuntu/trusty64'...
==> default: Matching MAC address for NAT networking...
==> default: Checking if box 'ubuntu/trusty64' is up to date...
==> default: A newer version of the box 'ubuntu/trusty64' is available!
...
```

This command will also provision the instance by running the ansible playbook
provided in the repository. In case you want to re-provision or add your own
modifications run the following command:

```bash
❯ vagrant provision
==> default: Running provisioner: ansible_local...
    default: Running ansible-playbook...
PLAY [default] *****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [default]
...
```

In case you want to connect to the Vagrant box run `vagrant ssh`.

At the end of the provision you should be able to curl the box and get a
response from the Cabify service.

```bash
❯ curl -Li http://localhost:8080/status
HTTP/1.0 200 OK
Date: Wed, 31 Jan 2018 17:40:28 GMT
Server: WSGIServer/0.1 Python/2.7.6
Content-Length: 3
Content-Type: text/html; charset=UTF-8
Connection: keep-alive

OK
```

## Part 1: Configuration Management

### Material provided

- Ansible code structure
- Test suite structure
- VagrantFile

### Assignment

Given the description provided at the beginning of the challenge, the tasks to
be completed in this part are:

- Containerize `cabify` service using Docker.
- Manage the service discovery of the service using Consul.
- Improve the service balancing strategy using HAProxy. There are
   many solutions for this task, some of them combine HAProxy with other
   technologies and you are allowed to do so.

The result of the assignment should have at least two instances of the Cabify
service running and should be accessible from the host via curl just like in
the example above.

## Part 2: Questions

The following questions don’t have a unique answer or a unique solution, here we
expect from the applicant to answer with a detailed solution going as deep as
possible reasoning every decision.

- Identify the SPOFs in the result of the assignment and explain how you would
  solve them.
- Explain how would you upgrade the Cabify service without downtime. We
  would like to have a short term solution, something that in the real world
  you would be able to deliver the same day or week. Then provide an
  explanation for a more complex solution where you improve the state of this
  assignment to your ideal release management process.

## Challenge Delivery Requirements

Think of this assignment as if it were production ready. You need to deliver
the folowing:

- GitHub repository with the solution.
- README explaining the solution. Links pointing to external documentation
  justifying your arguments are welcomed.

Good luck!
