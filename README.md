# Kubernetes operations runbook

A practical runbook for engineers who operate Kubernetes clusters: 142 short answers with YAML examples and `kubectl` commands, covering workloads, networking, storage, security, upgrades and troubleshooting.

Every YAML example is validated against the current Kubernetes schema in CI. See [CONTRIBUTING.md](CONTRIBUTING.md) if you want to improve the runbook.

## Table of Contents

- [1. What is Kubernetes?](#1-what-is-kubernetes)
- [2. What are the key components of a Kubernetes cluster?](#2-what-are-the-key-components-of-a-kubernetes-cluster)
- [3. Describe the role of kube-scheduler in a Kubernetes cluster.](#3-describe-the-role-of-kube-scheduler-in-a-kubernetes-cluster)
- [4. What is a Kubernetes Namespace and why is it used?](#4-what-is-a-kubernetes-namespace-and-why-is-it-used)
- [5. Explain the difference between a Kubernetes Deployment and a Pod.](#5-explain-the-difference-between-a-kubernetes-deployment-and-a-pod)
- [6. What is a Kubernetes Service and how does it provide access to Pods?](#6-what-is-a-kubernetes-service-and-how-does-it-provide-access-to-pods)
- [7. What are the different types of Kubernetes Services?](#7-what-are-the-different-types-of-kubernetes-services)
- [8. How do you expose a Kubernetes Deployment to the outside world?](#8-how-do-you-expose-a-kubernetes-deployment-to-the-outside-world)
- [9. What is a Kubernetes Volume and why is it important?](#9-what-is-a-kubernetes-volume-and-why-is-it-important)
- [10. Explain the concept of a Kubernetes Secret and its use cases.](#10-explain-the-concept-of-a-kubernetes-secret-and-its-use-cases)
- [11. How do you scale a Kubernetes Deployment?](#11-how-do-you-scale-a-kubernetes-deployment)
- [12. What is a Kubernetes ConfigMap and how is it used?](#12-what-is-a-kubernetes-configmap-and-how-is-it-used)
- [13. Describe the purpose of Kubernetes Resource Limits and Requests.](#13-describe-the-purpose-of-kubernetes-resource-limits-and-requests)
- [14.  What is a Kubernetes Liveness Probe and how does it work?](#14--what-is-a-kubernetes-liveness-probe-and-how-does-it-work)
- [15. What is a Kubernetes Readiness Probe and how is it different from a Liveness Probe?](#15-what-is-a-kubernetes-readiness-probe-and-how-is-it-different-from-a-liveness-probe)
- [16. What are Init Containers in Kubernetes and when are they used?](#16-what-are-init-containers-in-kubernetes-and-when-are-they-used)
- [17. Explain the concept of a Kubernetes StatefulSet.](#17-explain-the-concept-of-a-kubernetes-statefulset)
- [18. What is the purpose of a Kubernetes Job?](#18-what-is-the-purpose-of-a-kubernetes-job)
- [19. How do you perform a rolling update on a Kubernetes Deployment?](#19-how-do-you-perform-a-rolling-update-on-a-kubernetes-deployment)
- [20. What is a Kubernetes DaemonSet and when would you use it?](#20-what-is-a-kubernetes-daemonset-and-when-would-you-use-it)
- [21.  Describe how to perform a basic health check on a Kubernetes cluster.](#21--describe-how-to-perform-a-basic-health-check-on-a-kubernetes-cluster)
- [22. What is kubectl and what are some common kubectl commands?](#22-what-is-kubectl-and-what-are-some-common-kubectl-commands)
- [23.  How do you troubleshoot networking issues in a Kubernetes cluster?](#23--how-do-you-troubleshoot-networking-issues-in-a-kubernetes-cluster)
- [24. What is a Kubernetes Namespace and how does it relate to resource isolation?](#24-what-is-a-kubernetes-namespace-and-how-does-it-relate-to-resource-isolation)
- [25. Explain the concept of a Kubernetes Role-Based Access Control (RBAC).](#25-explain-the-concept-of-a-kubernetes-role-based-access-control-rbac)
- [26. What are the components of RBAC in Kubernetes?](#26-what-are-the-components-of-rbac-in-kubernetes)
- [27. How do you create and apply a Kubernetes Secret?](#27-how-do-you-create-and-apply-a-kubernetes-secret)
- [28. What are some common reasons for Pod failures in Kubernetes, and how do you troubleshoot them?](#28-what-are-some-common-reasons-for-pod-failures-in-kubernetes-and-how-do-you-troubleshoot-them)
- [29. What are the different ways to provide persistent storage to applications in Kubernetes?](#29-what-are-the-different-ways-to-provide-persistent-storage-to-applications-in-kubernetes)
- [30. How do you configure a Kubernetes Service to use a specific IP address?](#30-how-do-you-configure-a-kubernetes-service-to-use-a-specific-ip-address)
- [31.  What is a Kubernetes Ingress Controller, and how does it work?](#31--what-is-a-kubernetes-ingress-controller-and-how-does-it-work)
- [32. Explain the difference between `kubectl apply` and `kubectl replace` commands.](#32-explain-the-difference-between-kubectl-apply-and-kubectl-replace-commands)
- [33.  What is a Kubernetes PersistentVolume (PV), and how does it differ from a PersistentVolumeClaim (PVC)?](#33--what-is-a-kubernetes-persistentvolume-pv-and-how-does-it-differ-from-a-persistentvolumeclaim-pvc)
- [34. How do you configure resource limits and requests for containers within a Pod?](#34-how-do-you-configure-resource-limits-and-requests-for-containers-within-a-pod)
- [35. Explain the concept of a Kubernetes Deployment strategy, and describe different types of strategies.](#35-explain-the-concept-of-a-kubernetes-deployment-strategy-and-describe-different-types-of-strategies)
- [36. What is a Kubernetes CronJob, and how is it different from a regular Job?](#36-what-is-a-kubernetes-cronjob-and-how-is-it-different-from-a-regular-job)
- [37. How do you monitor the resource usage of your Kubernetes cluster?](#37-how-do-you-monitor-the-resource-usage-of-your-kubernetes-cluster)
- [38.  What are some best practices for writing Kubernetes YAML files?](#38--what-are-some-best-practices-for-writing-kubernetes-yaml-files)
- [39.  What is a Kubernetes ServiceAccount, and why is it used?](#39--what-is-a-kubernetes-serviceaccount-and-why-is-it-used)
- [40.  How do you configure a Pod to use a specific ServiceAccount?](#40--how-do-you-configure-a-pod-to-use-a-specific-serviceaccount)
- [41. What are some common use cases for Kubernetes in different industries?](#41-what-are-some-common-use-cases-for-kubernetes-in-different-industries)
- [42. How do you upgrade a Kubernetes cluster to a newer version?](#42-how-do-you-upgrade-a-kubernetes-cluster-to-a-newer-version)
- [43.  What are some challenges of running stateful applications in Kubernetes, and how do you address them?](#43--what-are-some-challenges-of-running-stateful-applications-in-kubernetes-and-how-do-you-address-them)
- [44.  How do you implement network security policies in Kubernetes?](#44--how-do-you-implement-network-security-policies-in-kubernetes)
- [45. What are some tools and techniques for debugging Kubernetes applications?](#45-what-are-some-tools-and-techniques-for-debugging-kubernetes-applications)
- [46. Explain the concept of a Kubernetes context, and how do you switch between different contexts?](#46-explain-the-concept-of-a-kubernetes-context-and-how-do-you-switch-between-different-contexts)
- [47.  What is the purpose of a Kubernetes LimitRange, and provide an example use case.](#47--what-is-the-purpose-of-a-kubernetes-limitrange-and-provide-an-example-use-case)
- [48. Describe the process of setting up a highly available Kubernetes cluster.](#48-describe-the-process-of-setting-up-a-highly-available-kubernetes-cluster)
- [49. What is the difference between a node's operating system and its container runtime in the context of Kubernetes?](#49-what-is-the-difference-between-a-nodes-operating-system-and-its-container-runtime-in-the-context-of-kubernetes)
- [50. How do you back up and restore a Kubernetes cluster?](#50-how-do-you-back-up-and-restore-a-kubernetes-cluster)
- [51. What are the different installation methods for Kubernetes?](#51-what-are-the-different-installation-methods-for-kubernetes)
- [52. Describe the purpose and functionality of the kubelet component.](#52-describe-the-purpose-and-functionality-of-the-kubelet-component)
- [53. Explain the role of the API server in a Kubernetes cluster.](#53-explain-the-role-of-the-api-server-in-a-kubernetes-cluster)
- [54.  What is a Kubernetes Custom Resource Definition (CRD), and why is it used?](#54--what-is-a-kubernetes-custom-resource-definition-crd-and-why-is-it-used)
- [55.  How do you implement a blue/green deployment strategy in Kubernetes?](#55--how-do-you-implement-a-bluegreen-deployment-strategy-in-kubernetes)
- [56. Explain the concept of container image immutability and its importance.](#56-explain-the-concept-of-container-image-immutability-and-its-importance)
- [57. What are some strategies for managing secrets securely in Kubernetes?](#57-what-are-some-strategies-for-managing-secrets-securely-in-kubernetes)
- [58. Describe the purpose of a Kubernetes Horizontal Pod Autoscaler (HPA).](#58-describe-the-purpose-of-a-kubernetes-horizontal-pod-autoscaler-hpa)
- [59.  What is a Kubernetes PodDisruptionBudget (PDB), and when would you use it?](#59--what-is-a-kubernetes-poddisruptionbudget-pdb-and-when-would-you-use-it)
- [60. How do you implement resource quotas at the namespace level in Kubernetes?](#60-how-do-you-implement-resource-quotas-at-the-namespace-level-in-kubernetes)
- [61. Explain the concept of a sidecar container in a Kubernetes Pod, and provide an example use case.](#61-explain-the-concept-of-a-sidecar-container-in-a-kubernetes-pod-and-provide-an-example-use-case)
- [62. What is a Kubernetes Operator, and what are its benefits?](#62-what-is-a-kubernetes-operator-and-what-are-its-benefits)
- [63. Describe the difference between ephemeral and persistent storage in Kubernetes.](#63-describe-the-difference-between-ephemeral-and-persistent-storage-in-kubernetes)
- [64. How do you configure a Kubernetes Service to perform health checks on its backend Pods?](#64-how-do-you-configure-a-kubernetes-service-to-perform-health-checks-on-its-backend-pods)
- [65.  What is the purpose of a Kubernetes init container, and how is it different from a regular container?](#65--what-is-the-purpose-of-a-kubernetes-init-container-and-how-is-it-different-from-a-regular-container)
- [66. Describe the process of configuring and using a ConfigMap in a Kubernetes Deployment.](#66-describe-the-process-of-configuring-and-using-a-configmap-in-a-kubernetes-deployment)
- [67. Explain the different types of Kubernetes probes and their purposes.](#67-explain-the-different-types-of-kubernetes-probes-and-their-purposes)
- [68.  Explain the difference between `kubectl exec` and `kubectl logs` commands.](#68--explain-the-difference-between-kubectl-exec-and-kubectl-logs-commands)
- [69.  How do you configure a Pod to use a specific Docker image from a private registry?](#69--how-do-you-configure-a-pod-to-use-a-specific-docker-image-from-a-private-registry)
- [70.  What is a Kubernetes Ingress resource, and how does it differ from a Service?](#70--what-is-a-kubernetes-ingress-resource-and-how-does-it-differ-from-a-service)
- [71. Explain the concept of a Kubernetes Deployment rollout strategy.](#71-explain-the-concept-of-a-kubernetes-deployment-rollout-strategy)
- [72. How do you troubleshoot container image pull limits in a Kubernetes cluster?](#72-how-do-you-troubleshoot-container-image-pull-limits-in-a-kubernetes-cluster)
- [73.  Describe the purpose and use cases for Kubernetes annotations.](#73--describe-the-purpose-and-use-cases-for-kubernetes-annotations)
- [74. Explain the difference between a stable, beta, and alpha API version in Kubernetes.](#74-explain-the-difference-between-a-stable-beta-and-alpha-api-version-in-kubernetes)
- [75. How do you configure a Kubernetes Pod to run on a specific node?](#75-how-do-you-configure-a-kubernetes-pod-to-run-on-a-specific-node)
- [76.  What is a Kubernetes Headless Service, and when would you use it?](#76--what-is-a-kubernetes-headless-service-and-when-would-you-use-it)
- [77.  Describe the process of setting up a private Docker registry within a Kubernetes cluster.](#77--describe-the-process-of-setting-up-a-private-docker-registry-within-a-kubernetes-cluster)
- [78. What is a Kubernetes NetworkPolicy, and how does it enhance cluster security?](#78-what-is-a-kubernetes-networkpolicy-and-how-does-it-enhance-cluster-security)
- [79. Explain the concept of a Kubernetes ServiceAccount token, and describe its security implications.](#79-explain-the-concept-of-a-kubernetes-serviceaccount-token-and-describe-its-security-implications)
- [80. How do you configure a Pod to use a pre-existing persistent volume claim?](#80-how-do-you-configure-a-pod-to-use-a-pre-existing-persistent-volume-claim)
- [81. What is the difference between `kubectl port-forward` and `kubectl proxy`?](#81-what-is-the-difference-between-kubectl-port-forward-and-kubectl-proxy)
- [82.  How do you configure a Service to expose a Deployment on a specific port range?](#82--how-do-you-configure-a-service-to-expose-a-deployment-on-a-specific-port-range)
- [83. Explain the concept of a Kubernetes namespace and its relation to RBAC.](#83-explain-the-concept-of-a-kubernetes-namespace-and-its-relation-to-rbac)
- [84. How do you configure a Kubernetes deployment to perform automated rollouts during container image updates?](#84-how-do-you-configure-a-kubernetes-deployment-to-perform-automated-rollouts-during-container-image-updates)
- [85. What are some common troubleshooting steps for a Kubernetes Pod that is stuck in a "CrashLoopBackOff" state?](#85-what-are-some-common-troubleshooting-steps-for-a-kubernetes-pod-that-is-stuck-in-a-crashloopbackoff-state)
- [86. Explain the concept of a Kubernetes PersistentVolume (PV) and its lifecycle.](#86-explain-the-concept-of-a-kubernetes-persistentvolume-pv-and-its-lifecycle)
- [87. How do you implement role-based access control (RBAC) for users in a Kubernetes cluster?](#87-how-do-you-implement-role-based-access-control-rbac-for-users-in-a-kubernetes-cluster)
- [88. Describe the purpose and benefits of using a Kubernetes ServiceMesh.](#88-describe-the-purpose-and-benefits-of-using-a-kubernetes-servicemesh)
- [89. How do you configure a Kubernetes Deployment to use a specific container image pull policy?](#89-how-do-you-configure-a-kubernetes-deployment-to-use-a-specific-container-image-pull-policy)
- [90. Explain the purpose and functionality of the Kubernetes scheduler.](#90-explain-the-purpose-and-functionality-of-the-kubernetes-scheduler)
- [91. What are some common causes of resource contention in a Kubernetes cluster, and how do you mitigate them?](#91-what-are-some-common-causes-of-resource-contention-in-a-kubernetes-cluster-and-how-do-you-mitigate-them)
- [92. Describe the purpose and use cases for Kubernetes taints and tolerations.](#92-describe-the-purpose-and-use-cases-for-kubernetes-taints-and-tolerations)
- [93. How do you configure a Pod to use a specific DNS server in Kubernetes?](#93-how-do-you-configure-a-pod-to-use-a-specific-dns-server-in-kubernetes)
- [94. What are some security best practices for container images used in Kubernetes?](#94-what-are-some-security-best-practices-for-container-images-used-in-kubernetes)
- [95. Explain the difference between a deployment update and a deployment rollout in Kubernetes.](#95-explain-the-difference-between-a-deployment-update-and-a-deployment-rollout-in-kubernetes)
- [96. How do you monitor the events happening within a Kubernetes cluster?](#96-how-do-you-monitor-the-events-happening-within-a-kubernetes-cluster)
- [97. What are some common strategies for implementing disaster recovery in a Kubernetes environment?](#97-what-are-some-common-strategies-for-implementing-disaster-recovery-in-a-kubernetes-environment)
- [98. How do you configure a Service to distribute traffic evenly across Pods using a different algorithm than the default?](#98-how-do-you-configure-a-service-to-distribute-traffic-evenly-across-pods-using-a-different-algorithm-than-the-default)
- [99. Explain the purpose and use cases for Kubernetes Resource Limits.](#99-explain-the-purpose-and-use-cases-for-kubernetes-resource-limits)
- [100. What are the different ways to access the Kubernetes API from outside the cluster?](#100-what-are-the-different-ways-to-access-the-kubernetes-api-from-outside-the-cluster)
- [101.  Describe the process of creating and using a Kubernetes StorageClass.](#101--describe-the-process-of-creating-and-using-a-kubernetes-storageclass)
- [102. Explain the concept of "Quality of Service" (QoS) classes for Pods in Kubernetes.](#102-explain-the-concept-of-quality-of-service-qos-classes-for-pods-in-kubernetes)
- [103. How do you configure a Pod to run as a non-root user for security purposes?](#103-how-do-you-configure-a-pod-to-run-as-a-non-root-user-for-security-purposes)
- [104. What are the key differences between a StatefulSet and a Deployment in Kubernetes?](#104-what-are-the-key-differences-between-a-statefulset-and-a-deployment-in-kubernetes)
- [105. Explain the purpose and functionality of a Kubernetes EndpointSlice.](#105-explain-the-purpose-and-functionality-of-a-kubernetes-endpointslice)
- [106. How do you configure a Pod to use a specific network interface on the node?](#106-how-do-you-configure-a-pod-to-use-a-specific-network-interface-on-the-node)
- [107.  What is a Kubernetes Admission Controller, and describe its role in cluster security.](#107--what-is-a-kubernetes-admission-controller-and-describe-its-role-in-cluster-security)
- [108. How do you configure a Kubernetes Service to use a specific external IP address?](#108-how-do-you-configure-a-kubernetes-service-to-use-a-specific-external-ip-address)
- [109. Explain the concept of "affinity" in Kubernetes scheduling and its different types.](#109-explain-the-concept-of-affinity-in-kubernetes-scheduling-and-its-different-types)
- [110. How do you perform a rolling update of a Kubernetes Deployment using a canary deployment strategy?](#110-how-do-you-perform-a-rolling-update-of-a-kubernetes-deployment-using-a-canary-deployment-strategy)
- [111. What are some key considerations when designing a multi-tenant Kubernetes cluster?](#111-what-are-some-key-considerations-when-designing-a-multi-tenant-kubernetes-cluster)
- [112. Describe the purpose and functionality of the Kubernetes Container Runtime Interface (CRI).](#112-describe-the-purpose-and-functionality-of-the-kubernetes-container-runtime-interface-cri)
- [113.  How do you configure a Kubernetes Pod to use a custom hostname without modifying the container image?](#113--how-do-you-configure-a-kubernetes-pod-to-use-a-custom-hostname-without-modifying-the-container-image)
- [114. What are some strategies for implementing zero-downtime deployments in Kubernetes?](#114-what-are-some-strategies-for-implementing-zero-downtime-deployments-in-kubernetes)
- [115. Explain the purpose and functionality of a Kubernetes Custom Resource Definition (CRD) controller.](#115-explain-the-purpose-and-functionality-of-a-kubernetes-custom-resource-definition-crd-controller)
- [116.  How do you configure a Kubernetes Service to route traffic based on HTTP headers?](#116--how-do-you-configure-a-kubernetes-service-to-route-traffic-based-on-http-headers)
- [117. How do you troubleshoot a Kubernetes Service that is not routing traffic to its backend Pods?](#117-how-do-you-troubleshoot-a-kubernetes-service-that-is-not-routing-traffic-to-its-backend-pods)
- [118. Describe the purpose and benefits of using a Kubernetes Ingress Controller.](#118-describe-the-purpose-and-benefits-of-using-a-kubernetes-ingress-controller)
- [119. Explain the concept of a Kubernetes container lifecycle hook and its different phases.](#119-explain-the-concept-of-a-kubernetes-container-lifecycle-hook-and-its-different-phases)
- [120.  How do you configure resource requests and limits for init containers in Kubernetes?](#120--how-do-you-configure-resource-requests-and-limits-for-init-containers-in-kubernetes)
- [121.  What are the different ways to pass environment variables to containers in Kubernetes?](#121--what-are-the-different-ways-to-pass-environment-variables-to-containers-in-kubernetes)
- [122.  Explain the purpose and functionality of Kubernetes kube-proxy.](#122--explain-the-purpose-and-functionality-of-kubernetes-kube-proxy)
- [123.  What are some strategies for implementing a blue/green deployment using an Ingress Controller?](#123--what-are-some-strategies-for-implementing-a-bluegreen-deployment-using-an-ingress-controller)
- [124.  How do you configure a Pod to have access to the host's file system in Kubernetes?](#124--how-do-you-configure-a-pod-to-have-access-to-the-hosts-file-system-in-kubernetes)
- [125.  How do you configure a Pod to use a specific DNS policy in Kubernetes?](#125--how-do-you-configure-a-pod-to-use-a-specific-dns-policy-in-kubernetes)
- [126. What are some strategies for securing secrets at rest in Kubernetes?](#126-what-are-some-strategies-for-securing-secrets-at-rest-in-kubernetes)
- [127. Describe the process of scaling a Kubernetes Deployment using the Horizontal Pod Autoscaler (HPA).](#127-describe-the-process-of-scaling-a-kubernetes-deployment-using-the-horizontal-pod-autoscaler-hpa)
- [128. What are some common causes of a Kubernetes Pod being stuck in a "Pending" state?](#128-what-are-some-common-causes-of-a-kubernetes-pod-being-stuck-in-a-pending-state)
- [129. How do you configure a Pod to restart automatically if it exits with an error in Kubernetes?](#129-how-do-you-configure-a-pod-to-restart-automatically-if-it-exits-with-an-error-in-kubernetes)
- [130.  Explain the concept of a Kubernetes CronJob and provide an example of its scheduling syntax.](#130--explain-the-concept-of-a-kubernetes-cronjob-and-provide-an-example-of-its-scheduling-syntax)
- [131. How do you configure a Liveness probe that checks the TCP socket connection of a container in a Pod?](#131-how-do-you-configure-a-liveness-probe-that-checks-the-tcp-socket-connection-of-a-container-in-a-pod)
- [132.  What are some advantages of using a managed Kubernetes service compared to self-managed Kubernetes?](#132--what-are-some-advantages-of-using-a-managed-kubernetes-service-compared-to-self-managed-kubernetes)
- [133.  Explain the concept of Kubernetes resource requests and how they affect Pod scheduling.](#133--explain-the-concept-of-kubernetes-resource-requests-and-how-they-affect-pod-scheduling)
- [134.  What is the difference between `kubectl apply` and `kubectl create` commands?](#134--what-is-the-difference-between-kubectl-apply-and-kubectl-create-commands)
- [135.  How do you implement a "leader election" pattern for Pods in Kubernetes?](#135--how-do-you-implement-a-leader-election-pattern-for-pods-in-kubernetes)
- [136. Explain the purpose and functionality of the Kubernetes API aggregation layer.](#136-explain-the-purpose-and-functionality-of-the-kubernetes-api-aggregation-layer)
- [137. How do you configure a Kubernetes Deployment to roll back to a previous revision if a new update fails?](#137-how-do-you-configure-a-kubernetes-deployment-to-roll-back-to-a-previous-revision-if-a-new-update-fails)
- [138.  What is the purpose of Kubernetes namespaces from a security perspective?](#138--what-is-the-purpose-of-kubernetes-namespaces-from-a-security-perspective)
- [139. How do you troubleshoot a Kubernetes Pod that is stuck in an "ImagePullBackOff" state?](#139-how-do-you-troubleshoot-a-kubernetes-pod-that-is-stuck-in-an-imagepullbackoff-state)
- [140. Explain the purpose and functionality of Kubernetes Admission Webhooks.](#140-explain-the-purpose-and-functionality-of-kubernetes-admission-webhooks)
- [141.  How do you configure a Pod to be scheduled on a node with a specific label in Kubernetes?](#141--how-do-you-configure-a-pod-to-be-scheduled-on-a-node-with-a-specific-label-in-kubernetes)
- [142. What are some best practices for managing Kubernetes YAML configuration files?](#142-what-are-some-best-practices-for-managing-kubernetes-yaml-configuration-files)
- [License](#license)

## Questions and Answers

### 1. What is Kubernetes?

**Answer:** Kubernetes is an open-source container orchestration platform that automates deploying, scaling, and managing containerized applications.

**Documentation:** [https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/](https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/)

**Explanation:** Imagine you have multiple containers, each containing a part of your application. Kubernetes helps you run those containers on a cluster of machines, ensuring they have the necessary resources, can communicate with each other, and are highly available.

### 2. What are the key components of a Kubernetes cluster?

**Answer:** A Kubernetes cluster consists of:

- **Control plane node(s):** Run the control plane components (kube-apiserver, etcd, kube-scheduler, kube-controller-manager). They manage the cluster, schedule Pods, and monitor overall health.
- **Worker Node(s):** Run the containers within Pods. Each runs the kubelet and a container runtime.
- **Pods:** The smallest deployable unit in Kubernetes, containing one or more containers.
- **Services:** Provide a stable endpoint for accessing Pods, even if they are rescheduled.

**Documentation:** [https://kubernetes.io/docs/concepts/overview/components/](https://kubernetes.io/docs/concepts/overview/components/)

**Explanation:** The control plane is the brain of the operation, deciding where to run your containers (Pods). Worker nodes are the workhorses, actually running your application's containers. Pods are like containers but grouped to ensure they run on the same node and can share resources. Services act as load balancers, directing traffic to the correct Pods.

### 3. Describe the role of kube-scheduler in a Kubernetes cluster.

**Answer:** The kube-scheduler is a key component of the Kubernetes control plane. It's responsible for assigning Pods to specific worker nodes based on resource requests, constraints, and other factors.

**Documentation:** [https://kubernetes.io/docs/concepts/scheduling-eviction/kube-scheduler/](https://kubernetes.io/docs/concepts/scheduling-eviction/kube-scheduler/)

**Explanation:** Think of the kube-scheduler as a matchmaker. It watches for newly created Pods that have no node assigned, compares their requests and constraints with the capacity of each node, and picks the best fit using its scheduling rules and policies.

### 4. What is a Kubernetes Namespace and why is it used?

**Answer:** A Namespace is a way to divide cluster resources between multiple users or teams. It provides logical isolation, allowing you to have resources with the same name in different namespaces. Most resources are namespaced; some, such as Nodes and PersistentVolumes, are cluster-scoped.

**Documentation:** [https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/)

**Explanation:** Imagine you have a development team and a production team sharing the same Kubernetes cluster. Namespaces allow them to have separate environments with their own deployments, services, and other resources, preventing naming conflicts and providing better resource management.

### 5. Explain the difference between a Kubernetes Deployment and a Pod.

**Answer:**

- **Pod:** A Pod is one or more containers scheduled together on a node that share its network and storage. It's the smallest deployable unit.
- **Deployment:** A Deployment manages a set of replica Pods, ensuring the desired number of replicas are always running.

**Documentation:**

- Pods: [https://kubernetes.io/docs/concepts/workloads/pods/](https://kubernetes.io/docs/concepts/workloads/pods/)
- Deployments: [https://kubernetes.io/docs/concepts/workloads/controllers/deployment/](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)

**Explanation:**  A Pod runs your containers. A Deployment is like a blueprint that tells Kubernetes how many replicas of a Pod to run, how to update them, and how to handle rollbacks. In practice you rarely create bare Pods; a Deployment creates a ReplicaSet, which creates them.

### 6. What is a Kubernetes Service and how does it provide access to Pods?

**Answer:** A Service is an abstraction that provides a stable endpoint to a set of Pods, even if they are dynamically created, destroyed, or rescheduled. It acts as a load balancer and provides network connectivity to your Pods.

**Documentation:** [https://kubernetes.io/docs/concepts/services-networking/service/](https://kubernetes.io/docs/concepts/services-networking/service/)

**Explanation:** Pods are ephemeral, meaning their IP addresses can change if they are recreated. Services provide a fixed entry point, allowing other applications or users to access your Pods without worrying about their underlying IP addresses.

### 7. What are the different types of Kubernetes Services?

**Answer:** Kubernetes offers several types of Services:

- **ClusterIP:** Exposes the Service on an internal IP in the cluster.
- **NodePort:** Exposes the Service on each Node’s IP at a static port (30000-32767 by default).
- **LoadBalancer:**  Exposes the Service externally using a cloud provider's load balancer.
- **ExternalName:** Maps the Service to an external DNS name through a CNAME record.

**Documentation:** [https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types)

**Explanation:** The choice of Service type depends on how you need to access your application. `ClusterIP` is for internal access within the cluster. `NodePort` is for external access via node IP addresses. `LoadBalancer` integrates with cloud providers for managed load balancing. `ExternalName` is for mapping to external DNS names.

### 8. How do you expose a Kubernetes Deployment to the outside world?

**Answer:** You can expose a Deployment to the outside world using:

- **Services:** Create a Service (e.g., LoadBalancer, NodePort) to expose your Deployment on a specific port.
- **Ingress:** Use an Ingress controller and Ingress resource to manage external access to your services based on HTTP/HTTPS rules.

**Documentation:**

- Services: [https://kubernetes.io/docs/concepts/services-networking/service/](https://kubernetes.io/docs/concepts/services-networking/service/)
- Ingress: [https://kubernetes.io/docs/concepts/services-networking/ingress/](https://kubernetes.io/docs/concepts/services-networking/ingress/)

**Explanation:** Services provide basic exposure, while Ingress offers more advanced routing and TLS termination capabilities for HTTP/HTTPS traffic. The ingress-nginx controller is retired and no longer receives releases or security fixes, and the Ingress API is frozen. Gateway API is the recommended successor for new setups.

### 9. What is a Kubernetes Volume and why is it important?

**Answer:** A Volume is a directory, reachable by the containers in a Pod, that holds data outside the container's filesystem. A Volume's lifetime is tied to its Pod: an `emptyDir` survives container restarts but is removed when the Pod is deleted. Data that must outlive the Pod is stored in a PersistentVolume, claimed through a PersistentVolumeClaim.

**Documentation:** [https://kubernetes.io/docs/concepts/storage/volumes/](https://kubernetes.io/docs/concepts/storage/volumes/)

**Explanation:**  By default, containers have ephemeral storage, meaning data is lost if the container is restarted. Volumes solve this for data that must survive container restarts or be shared between containers in a Pod, and PersistentVolumes cover data that must survive the Pod itself.

### 10. Explain the concept of a Kubernetes Secret and its use cases.

**Answer:** A Secret is an object that stores sensitive information, such as passwords, tokens, or keys. Its values are stored base64-encoded, which is an encoding rather than encryption; encryption at rest must be configured separately on the API server.

**Documentation:** [https://kubernetes.io/docs/concepts/configuration/secret/](https://kubernetes.io/docs/concepts/configuration/secret/)

**Explanation:**  Secrets help you manage confidential data without hardcoding it into your application configurations. You can mount Secrets into Pods as volumes or expose them as environment variables.

### 11. How do you scale a Kubernetes Deployment?

**Answer:** You can scale a Deployment:

- **Manually:** Set the replica count with `kubectl scale deployment/<name> --replicas=<n>`.
- **Automatically:** Use the Horizontal Pod Autoscaler (HPA), which adjusts the replica count based on metrics such as CPU utilization.

**Documentation:** [https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#scaling-a-deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#scaling-a-deployment)

**Explanation:** Scaling changes the number of Pods that serve your application. The HPA does this automatically, based on the metrics you define.

### 12. What is a Kubernetes ConfigMap and how is it used?

**Answer:** A ConfigMap is an object that stores configuration data in key-value pairs. It separates configuration from container images, making applications more portable.

**Documentation:** [https://kubernetes.io/docs/concepts/configuration/configmap/](https://kubernetes.io/docs/concepts/configuration/configmap/)

**Explanation:** Instead of hardcoding configuration values within your application, you can store them in a ConfigMap. You can change the configuration without rebuilding container images. ConfigMap data is not encrypted and is not meant for sensitive values; use a Secret for those.

### 13. Describe the purpose of Kubernetes Resource Limits and Requests.

**Answer:**  Resource Requests and Limits are used to:

- **Requests:** The amount of CPU and memory the scheduler reserves for a container when it places the Pod on a node.
- **Limits:** The maximum a container can use. CPU above the limit is throttled; memory above the limit gets the container OOMKilled.

**Documentation:** [https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/)

**Explanation:**  These settings help you manage resource allocation and prevent resource starvation. Requests ensure that Pods get the minimum resources they need, while Limits prevent them from consuming excessive resources and impacting other applications.

### 14.  What is a Kubernetes Liveness Probe and how does it work?

**Answer:** A Liveness Probe is a periodic check that the kubelet performs on a container to determine if it's still running as expected. If a Liveness Probe fails, Kubernetes restarts the container.

**Documentation:** [https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/)

**Explanation:** Liveness Probes are essential for self-healing. They detect unresponsive or deadlocked containers and restart them. Avoid checks that depend on external services, such as a database: if that dependency fails, every container would restart at once.

### 15. What is a Kubernetes Readiness Probe and how is it different from a Liveness Probe?

**Answer:**

- **Liveness Probe:** Checks if a container is running; restarts it if it fails.
- **Readiness Probe:** Checks if a container is ready to serve traffic; removes it from the Service endpoints if it fails.

**Documentation:** [https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/)

**Explanation:** While Liveness Probes focus on container health, Readiness Probes control when a container receives traffic. The Pod is added to the Service's endpoints only after its readiness checks pass.

### 16. What are Init Containers in Kubernetes and when are they used?

**Answer:** Init Containers are specialized containers that run to completion before any other containers in a Pod are started. They are used for tasks that need to be completed before the main application containers run.

**Documentation:** [https://kubernetes.io/docs/concepts/workloads/pods/init-containers/](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/)

**Explanation:** Imagine you need to download a configuration file or run a database migration script before your main application starts. Init Containers provide a way to perform these tasks in a predictable order. They run one at a time, in the order listed, and each must exit successfully before the next one starts.

### 17. Explain the concept of a Kubernetes StatefulSet.

**Answer:** A StatefulSet is a workload API object used to manage stateful applications, such as databases. It provides guarantees about the ordering and uniqueness of Pods.

**Documentation:** [https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/)

**Explanation:** Unlike Deployments, where Pods are interchangeable, StatefulSets maintain a sticky identity for each Pod. This is crucial for applications that require persistent storage, stable network identities, or ordered deployment. Stable network identities also need a headless Service (`clusterIP: None`) named in the StatefulSet's `serviceName` field.

### 18. What is the purpose of a Kubernetes Job?

**Answer:** A Job is a workload object used to run Pods that perform a specific task to completion, such as batch processing or running a one-time script.

**Documentation:** [https://kubernetes.io/docs/concepts/workloads/controllers/job/](https://kubernetes.io/docs/concepts/workloads/controllers/job/)

**Explanation:** Unlike Deployments, which maintain a desired number of running Pods, Jobs are designed to run once and then terminate. They are ideal for tasks that have a defined start and end point.

### 19. How do you perform a rolling update on a Kubernetes Deployment?

**Answer:** Deployments perform rolling updates by default when you change the Pod template (for example, a new container image). The Deployment gradually replaces old Pods with new ones while keeping a set number available, controlled by `maxSurge` and `maxUnavailable`. Typical commands:

```bash
kubectl set image deployment/<name> <container>=<image>:<tag>
kubectl rollout status deployment/<name>
kubectl rollout undo deployment/<name>   # roll back if the update fails
```

**Documentation:** [https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#updating-a-deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#updating-a-deployment)

**Explanation:** Rolling updates minimize downtime during application updates. Kubernetes gradually introduces new Pods while removing old ones, ensuring that your application remains available throughout the process.

### 20. What is a Kubernetes DaemonSet and when would you use it?

**Answer:** A DaemonSet ensures that a copy of a Pod runs on each node in your cluster (or a subset of nodes). It's often used for tasks like log collection, monitoring, or system services that need to run on every node.

**Documentation:** [https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/)

**Explanation:** If you need to run a specific Pod on each node in your cluster, a DaemonSet is the right choice. It automatically manages Pod creation and scheduling based on your node selection criteria.

### 21.  Describe how to perform a basic health check on a Kubernetes cluster.

**Answer:** You can perform basic health checks using:

- **kubectl get nodes:**  Check the status of your nodes.
- **kubectl get pods -A:**  View the status of Pods across all namespaces.
- **kubectl describe node <node-name>:**  Get detailed information about a specific node.
- **kubectl logs <pod-name>:** View logs from a Pod to diagnose issues.
- **kubectl cluster-info:** Get basic information about the cluster.
- **kubectl get --raw='/readyz?verbose':** Check the readiness of the control plane components.

**Documentation:** [https://kubernetes.io/docs/tasks/debug-application-cluster/debug-cluster/#checking-cluster-health](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-cluster/#checking-cluster-health)

**Explanation:** These commands provide insights into the overall health of your nodes, pods, and cluster components. They help you identify any potential issues or errors.

### 22. What is kubectl and what are some common kubectl commands?

**Answer:**  kubectl is the command-line tool for interacting with a Kubernetes cluster. Some common commands include:

- **kubectl get:** List resources (pods, deployments, services)
- **kubectl create:** Create resources from YAML or JSON definitions.
- **kubectl apply:** Apply configuration changes to resources.
- **kubectl delete:**  Delete resources.
- **kubectl logs:** View logs from containers.
- **kubectl exec:** Execute commands in a running container.
- **kubectl scale:**  Scale deployments (adjust replica count).
- **kubectl describe:** Get detailed information about a resource.

**Documentation:** [https://kubernetes.io/docs/reference/kubectl/overview/](https://kubernetes.io/docs/reference/kubectl/overview/)

**Explanation:**  kubectl is your primary interface for managing Kubernetes. You'll use it for everything from deploying applications to troubleshooting issues.

### 23.  How do you troubleshoot networking issues in a Kubernetes cluster?

**Answer:**  Troubleshooting networking in Kubernetes involves:

- **Checking Network Policies:**  See if network policies are restricting traffic.
- **Inspecting Services:** Verify that services are correctly configured and selecting the correct Pods.
- **Examining Endpoints:**  Check EndpointSlices for the correct IP addresses and ports of the backing Pods. The older Endpoints API has been deprecated since v1.33.
- **Checking DNS:** Confirm that the Service name resolves (for example, with `nslookup`) and that the CoreDNS Pods are running.
- **Using debug tools:** Run `curl`, `nslookup`, or `traceroute` from a debug container, such as `kubectl debug -it <pod-name> --image=<image-with-tools>`, because application images often lack them.

**Documentation:** [https://kubernetes.io/docs/tasks/debug/debug-application/debug-service/](https://kubernetes.io/docs/tasks/debug/debug-application/debug-service/)

**Explanation:** Work from the Service down: confirm that it selects healthy Pods and has endpoints, then test connectivity from inside the cluster.

### 24. What is a Kubernetes Namespace and how does it relate to resource isolation?

**Answer:** A Namespace provides a logical boundary for names and resource grouping within a Kubernetes cluster. It lets you organize Pods, Services, Deployments, and other namespaced resources into separate areas. On its own, a Namespace does not isolate network traffic or limit resource consumption; use NetworkPolicy, ResourceQuota, and LimitRange for that.

**Documentation:** [https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/)

**Explanation:** Imagine you have multiple teams sharing the same cluster. Namespaces allow them to have their own areas where they can deploy applications with the same names without conflicts. Security comes from RBAC and NetworkPolicy scoped to each Namespace, not from the Namespace itself.

### 25. Explain the concept of a Kubernetes Role-Based Access Control (RBAC).

**Answer:**  Role-Based Access Control (RBAC) is the Kubernetes authorization mode that controls which users and ServiceAccounts can perform which actions. A permission is a verb (such as `get`, `list`, or `create`) on a resource type. Roles are namespaced, ClusterRoles are cluster-scoped, and RoleBindings or ClusterRoleBindings attach them to subjects.

**Documentation:** [https://kubernetes.io/docs/reference/access-authn-authz/rbac/](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)

**Explanation:** RBAC is essential for securing your Kubernetes cluster. It allows you to define granular permissions, ensuring that users and applications only have access to the resources they need to perform their tasks.
### 26. What are the components of RBAC in Kubernetes?

**Answer:** RBAC in Kubernetes consists of:

- **Subjects:** Users, groups, or service accounts that need access.
- **Roles:**  Define a set of permissions (verbs) on Kubernetes resources.
- **RoleBindings:** Grant permissions defined in a Role to a Subject.
- **ClusterRoles:**  Similar to Roles but apply cluster-wide.
- **ClusterRoleBindings:**  Grant ClusterRoles to Subjects.

**Documentation:** [https://kubernetes.io/docs/reference/access-authn-authz/rbac/](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)

**Explanation:** You define Roles with specific permissions, then bind those Roles to Subjects (users or service accounts) using RoleBindings to control access to Kubernetes resources.

### 27. How do you create and apply a Kubernetes Secret?

**Answer:**  You can create a Secret using either a YAML file or the `kubectl create secret` command.

**Example YAML:**

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: my-secret
type: Opaque
data:
  username: <base64-encoded-username>
  password: <base64-encoded-password>
```

**Kubectl Command:**

```bash
kubectl create secret generic my-secret --from-literal=username=<username> --from-literal=password=<password>
```

**Applying the Secret:**

To use the Secret, mount it as a volume or environment variable in your Pod definition.

**Documentation:** [https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/#create-a-secret](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/#create-a-secret)

**Explanation:** Secret values are base64-encoded, not encrypted. With `kubectl create secret`, kubectl encodes the values for you. In YAML `data`, you must supply base64 yourself, or use `stringData` for plain text.

### 28. What are some common reasons for Pod failures in Kubernetes, and how do you troubleshoot them?

**Answer:**

**Common Pod Failure Reasons:**

- **ImagePullBackOff:**  The container image cannot be pulled from the registry.
- **CrashLoopBackOff:** The container repeatedly crashes after starting.
- **ErrImagePull:** Error pulling the container image.
- **Pending:** The Pod cannot be scheduled (insufficient CPU or memory, a node selector or taint mismatch, or an unbound PVC).
- **OOMKilled:** The container exceeded its memory limit.

**Troubleshooting:**

- **Check Logs (`kubectl logs`)**: Inspect container logs for error messages. For a crashing container, add `--previous` to see the output of the last run.
- **Describe the Pod (`kubectl describe pod`)**: Get details about the Pod's status and events.
- **Check Events (`kubectl get events`)**:  Review cluster events for relevant information.
- **Exec into the Pod (`kubectl exec`)**: If possible, execute commands inside the container for debugging.

**Documentation:** [https://kubernetes.io/docs/tasks/debug-application-cluster/debug-running-pod/](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-running-pod/)

**Explanation:** By analyzing Pod logs, descriptions, and events, you can often pinpoint the root cause of failures. Direct access to the container via `kubectl exec` allows for deeper troubleshooting.

### 29. What are the different ways to provide persistent storage to applications in Kubernetes?

**Answer:**

**Persistent Storage Options:**

- **Volumes:**  Abstract storage from the underlying infrastructure (e.g., hostPath, emptyDir, PersistentVolumeClaim).
- **PersistentVolumes (PVs):**  Represent a piece of storage provisioned by an administrator.
- **PersistentVolumeClaims (PVCs):** A request for storage by a user or application.
- **StorageClasses:** Allow administrators to define different tiers of storage with specific properties (e.g., performance, availability).

**Documentation:** [https://kubernetes.io/docs/concepts/storage/](https://kubernetes.io/docs/concepts/storage/)

**Explanation:** While basic Volumes offer simplicity, PVs and PVCs provide a robust way to manage and allocate storage resources. StorageClasses add another layer of abstraction for different storage tiers.

### 30. How do you configure a Kubernetes Service to use a specific IP address?

**Answer:**

You can assign a specific IP address to a Kubernetes Service using the `.spec.clusterIP` field in the Service definition. This works for `ClusterIP` Services, and also for `NodePort` and `LoadBalancer` Services, which get a cluster IP as well.

**Example:**

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  clusterIP: "10.100.10.150" # Specify the desired IP address
  selector:
    app: my-app
  ports:
  - port: 80
    targetPort: 8080
```

**Important Considerations:**

- **IP Address Range:**  The specified IP must be within the configured Service CIDR range of your cluster.
- **Uniqueness:** The IP address must be unique within the cluster and not already in use by another Service.

**Documentation:** [https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service)

**Explanation:** By default, Kubernetes automatically assigns an IP from the Service CIDR range. If you need to use a specific IP, you can set it manually in the Service definition, but ensure it adheres to cluster settings.

### 31.  What is a Kubernetes Ingress Controller, and how does it work?

**Answer:**

An Ingress Controller is a specialized load balancer that works at the HTTP/HTTPS layer to route traffic to different services within your Kubernetes cluster. It acts as a reverse proxy, intercepting requests from outside the cluster and forwarding them to the appropriate services based on rules defined in Ingress resources.

**Key Functions:**

- **Traffic Routing:** Directs traffic based on hostnames, paths, and other HTTP/HTTPS criteria.
- **TLS Termination:**  Handles SSL/TLS encryption/decryption, offloading that responsibility from your backend services.
- **Virtual Hosting:** Allows you to host multiple applications on the same IP address using different hostnames.

**How it Works:**

1. **Ingress Resource:** You create an Ingress resource that defines routing rules, such as hostnames, paths, and backend services.
2. **Ingress Controller:** The Ingress Controller (e.g., Traefik or another maintained controller; the community ingress-nginx project was retired in March 2026) monitors Ingress resources and configures itself to handle traffic according to the rules.
3. **Traffic Forwarding:** When a request arrives at the Ingress Controller, it inspects the request headers and forwards it to the appropriate service based on the matching rule.

**Documentation:** [https://kubernetes.io/docs/concepts/services-networking/ingress/](https://kubernetes.io/docs/concepts/services-networking/ingress/)

**Explanation:** An Ingress Controller simplifies external access to your services by providing a single entry point for all incoming traffic and handling routing, TLS termination, and virtual hosting. For new deployments, the Gateway API is the successor to Ingress.

### 32. Explain the difference between `kubectl apply` and `kubectl replace` commands.

**Answer:**

| Command | Description |
|---|---|
| `kubectl apply` | Merges changes from a configuration file into a resource.  It's a declarative approach. |
| `kubectl replace` | Replaces an existing resource entirely with the configuration from a file. It's an imperative approach. |

**When to Use:**

- **`kubectl apply`**: Use for incremental updates, adding or modifying fields without overwriting existing values. It's the preferred method in most cases.
- **`kubectl replace`**: Use with caution when you need to completely overwrite a resource, discarding any existing configuration.

**Documentation:**

- `kubectl apply`: [https://kubernetes.io/docs/reference/kubectl/generated/kubectl_apply/](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_apply/)
- `kubectl replace`: [https://kubernetes.io/docs/reference/kubectl/generated/kubectl_replace/](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_replace/)

**Explanation:** `kubectl apply` is more user-friendly for updates as it merges changes, while `kubectl replace` offers more control but can lead to unintended consequences if not used carefully.

### 33.  What is a Kubernetes PersistentVolume (PV), and how does it differ from a PersistentVolumeClaim (PVC)?

**Answer:**

| Feature | PersistentVolume (PV) | PersistentVolumeClaim (PVC) |
|---|---|---|
| Purpose | Represents a piece of storage provisioned by an administrator. | A request for storage by a user or application. |
| Scope | Cluster-wide | Namespace-bound |
| Lifecycle | Independent of Pods | Exists until deleted; Pods mount it through the PVC |
| Management | Managed by administrators | Requested and used by developers |

**Explanation:**

- **PV (Storage Provider):**  Think of it as a physical hard drive available in your cluster. It has details like capacity, access modes, and storage class.
- **PVC (Storage Request):** It's like asking for a specific amount of storage with certain characteristics (e.g., "I need 10GB of storage with ReadWriteOnce access mode").

The Kubernetes control plane then matches a suitable PV to a PVC, binding them together to provide storage to Pods.

**Documentation:**

- PersistentVolumes: [https://kubernetes.io/docs/concepts/storage/persistent-volumes/](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)

- PersistentVolumeClaims: [https://kubernetes.io/docs/concepts/storage/persistent-volumes/#persistentvolumeclaims](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#persistentvolumeclaims)

### 34. How do you configure resource limits and requests for containers within a Pod?

**Answer:**

You configure resource limits and requests in the `resources` section of your Pod's container definition using the following fields:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  containers:
  - name: my-container
    image: my-image
    resources:
      # Resource requests
      requests:
        cpu: "100m" # 100 millicores
        memory: "256Mi" # 256 MiB
      # Resource limits
      limits:
        cpu: "200m"
        memory: "512Mi"
```

**Fields:**

- **`requests`:**
  - **`cpu`:** CPU request (e.g., "500m" for half a CPU, "1" for one CPU).
  - **`memory`:**  Memory request (e.g., "128Mi", "1Gi").
- **`limits`:**
  - **`cpu`:** CPU limit (must be greater than or equal to the request).
  - **`memory`:** Memory limit (must be greater than or equal to the request). If you set a limit without a request, the request defaults to the limit.

**Documentation:** [https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/)

**Explanation:** Setting these values helps with resource management and prevents one application from starving others in the cluster.

### 35. Explain the concept of a Kubernetes Deployment strategy, and describe different types of strategies.

**Answer:**

A Deployment strategy in Kubernetes defines how updates to your application are rolled out. It controls factors like the speed of the update, the number of Pods updated simultaneously, and how rollbacks are handled.

**Deployment Strategies:**

- **RollingUpdate (default):**
  - Gradually updates Pods in a controlled manner.
  - You can configure `maxSurge` (how many new Pods can be created above the desired state) and `maxUnavailable` (how many Pods can be unavailable during the update).

- **Recreate:**
  - Deletes all existing Pods before creating new ones.
  - Introduces downtime during the update process.

- **Blue/Green (not a built-in strategy):**
  - Creates a new "green" deployment alongside the existing "blue" deployment.
  - Traffic is switched over to the "green" deployment once it's ready, usually by changing the Service selector.

**Documentation:** [https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#strategy](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#strategy)

**Explanation:** The right deployment strategy depends on your application's tolerance for downtime and the complexity of your update process.

### 36. What is a Kubernetes CronJob, and how is it different from a regular Job?

**Answer:**

| Feature | CronJob | Job |
|---|---|---|
| Purpose | Runs Pods on a schedule (like a cron job). | Runs a Pod or a set of Pods once. |
| Schedule | Defined using cron expressions. | Not applicable; runs immediately. |
| Repetition | Repeats based on the defined schedule. | Runs only once unless configured with `.spec.completions` greater than 1. |

**Explanation:**

- **CronJob:** Use for recurring tasks like backups, scheduled reports, or batch jobs that need to run at specific intervals.
- **Job:**  Use for one-time tasks like data processing, running a script, or executing a specific action.

**Documentation:**

- CronJob: [https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/](https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/)
- Job: [https://kubernetes.io/docs/concepts/workloads/controllers/job/](https://kubernetes.io/docs/concepts/workloads/controllers/job/)

### 37. How do you monitor the resource usage of your Kubernetes cluster?

**Answer:**

**Monitoring Options:**

- **Kubernetes Dashboard:** Archived in January 2026 and no longer maintained; use a maintained UI such as Headlamp instead.
- **Metrics Server:** Collects resource metrics (CPU, memory) from nodes and pods.
- **Monitoring Tools (Prometheus, Grafana, Datadog, etc.):** Offer advanced monitoring, visualization, and alerting capabilities.

**Steps:**

1. **Deploy Metrics Server (if not already present).**
2. **Use `kubectl top` commands:**
   - `kubectl top nodes`: View node resource usage.
   - `kubectl top pods`: View pod resource usage.
3. **Integrate with monitoring tools for dashboards and alerts.**

**Documentation:** [https://kubernetes.io/docs/tasks/debug-application-cluster/resource-usage-monitoring/](https://kubernetes.io/docs/tasks/debug-application-cluster/resource-usage-monitoring/)

**Explanation:** Basic monitoring can be done through kubectl, but for in-depth analysis and historical data, you'll need a more robust solution.

### 38.  What are some best practices for writing Kubernetes YAML files?

**Answer:**

**Best Practices:**

- **Indentation and Formatting:** Use 2-space indentation (the Kubernetes convention) and never tabs.
- **Comments:** Add meaningful comments to explain the purpose of different sections.
- **Labels and Annotations:** Use labels for selectors and annotations for metadata.
- **Templates and Functions:**  Leverage templates (Helm) and functions to avoid repetition and manage complex configurations.
- **Versioning:** Use a source code management system (Git) to track changes to YAML files.
- **Validation:** Validate against the API server with `kubectl apply --dry-run=server -f <file>`, or with a schema tool such as kubeconform.

**Documentation:**  While not a single documentation page, Kubernetes documentation emphasizes these practices throughout.

**Explanation:** Well-structured and commented YAML files are essential for maintainability, collaboration, and reducing errors.

### 39.  What is a Kubernetes ServiceAccount, and why is it used?

**Answer:**

A ServiceAccount provides an identity for processes running within Pods. It's used to:

- **Control Access to API Server:** Limit the actions Pods can perform by associating them with specific permissions using RBAC.
- **Authentication:** Authenticate requests from Pods to the Kubernetes API server.
- **Image Pull Secrets:** Attach `imagePullSecrets` that Pods using the ServiceAccount inherit.

**Key Points:**

- A `default` ServiceAccount is created in each namespace.
- Since Kubernetes 1.24, API tokens are short-lived projected tokens, not automatically created Secrets.
- Used to authenticate Pod actions, not user actions.

**Documentation:** [https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/](https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/)

**Explanation:** It's essential to understand that ServiceAccounts are for internal Kubernetes operations, granting Pods the necessary permissions to interact with the API server and other resources.

### 40.  How do you configure a Pod to use a specific ServiceAccount?

**Answer:**

You specify the ServiceAccount in the `spec.serviceAccountName` field of your Pod definition.

**Example:**

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  serviceAccountName: my-service-account # Name of the ServiceAccount to use
  containers:
  - name: my-container
    image: my-image
```

**Important:**

- The ServiceAccount must exist in the same namespace as the Pod.
- Ensure the ServiceAccount has the necessary RBAC permissions for the Pod's operations.

**Documentation:** [https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/](https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/)

**Explanation:**  This configuration associates a Pod with a specific ServiceAccount, allowing it to use the permissions and identity granted to that ServiceAccount.

### 41. What are some common use cases for Kubernetes in different industries?

**Answer:**

**Industry** | **Use Cases**
---|---
**Technology/Software** | Microservices deployments<br>CI/CD pipelines<br>Scaling applications on demand<br>Cloud-native application development
**E-commerce** | Handling traffic spikes during peak seasons<br>Running containerized workloads for online stores<br>Deploying and managing payment gateways
**Finance** | Running risk analysis and fraud detection algorithms<br>Hosting high-frequency trading applications<br>Managing sensitive financial data securely
**Healthcare** | Deploying and scaling healthcare applications<br>Storing and analyzing patient data<br>Running medical imaging workloads
**Media and Entertainment** | Streaming media content<br>Rendering and processing video<br>Delivering personalized content

**Explanation:** The table lists common patterns, not an exhaustive list.

### 42. How do you upgrade a Kubernetes cluster to a newer version?

**Answer:**

**Upgrading a Kubernetes cluster involves:**

1. **Planning and Backup:**
   - Review the release notes for the new version.
   - Back up important cluster data and configurations, including etcd.
   - Upgrade only one minor version at a time (for example, 1.36 to 1.37, not 1.35 to 1.37).

2. **Control Plane Upgrade (kubeadm):**
   - Follow provider-specific instructions if using a managed cluster.
   - Upgrade the `kubeadm` package to the target version from the `pkgs.k8s.io` repository for that minor version.
   - Run `kubeadm upgrade plan` to check the available target versions.
   - On the first control plane node, run `kubeadm upgrade apply vX.Y.Z`.
   - On each remaining control plane node, run `kubeadm upgrade node`.

3. **Node Upgrades:**
   - Drain (cordon and evict Pods) one node at a time: `kubectl drain <node-name> --ignore-daemonsets` (add `--delete-emptydir-data` if Pods use `emptyDir`).
   - On worker nodes, upgrade `kubeadm` and run `kubeadm upgrade node`.
   - Upgrade `kubelet` and `kubectl` with your package manager, using the `pkgs.k8s.io` repository for the target minor version.
   - Restart the kubelet: `sudo systemctl daemon-reload && sudo systemctl restart kubelet`.
   - Uncordon the node to make it available: `kubectl uncordon <node-name>`.
   - Repeat for each remaining node in the cluster.

4. **Verification:**
   - Ensure all nodes and the control plane are running the new version.
   - Check the health of your applications.

**Documentation:**

- Upgrading Kubernetes: [https://kubernetes.io/docs/tasks/administer-cluster/](https://kubernetes.io/docs/tasks/administer-cluster/)

**Explanation:** Cluster upgrades can be complex. Careful planning, backups, and following official documentation are essential for a successful upgrade.

### 43.  What are some challenges of running stateful applications in Kubernetes, and how do you address them?

**Answer:**

**Challenges:**

- **Data Persistence:** Ensuring data is not lost during pod reschedules or node failures.
- **Ordering and Uniqueness:** Maintaining the order of operations and ensuring each instance has a unique identity.
- **Storage Management:** Provisioning, attaching, and managing storage for stateful workloads.

**Addressing the Challenges:**

- **StatefulSets:** Use StatefulSets to manage deployments and updates of stateful applications. `volumeClaimTemplates` give each replica its own PVC, and by default those PVCs are kept when the StatefulSet scales down.
- **PersistentVolumes and PVCs:** Provide persistent storage and manage storage claims.
- **Headless Services:** Expose each instance of a stateful application with a unique DNS name.
- **Init Containers:** Perform initialization tasks (e.g., data loading) before the main containers start.

**Documentation:** [https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/)

**Explanation:** Kubernetes provides tools and features specifically designed to handle the complexities of running stateful applications reliably.

### 44.  How do you implement network security policies in Kubernetes?

**Answer:**

**Network Policies:**

- **NetworkPolicy Resources:** Define rules to control traffic flow between pods, namespaces, and external networks.
- **Ingress and Egress Rules:**  Specify allowed incoming (ingress) and outgoing (egress) traffic.
- **Selectors:**  Select pods based on labels, namespaces, or IP addresses.
- **NetworkPolicy Providers:**  Implement NetworkPolicy rules (e.g., Calico, Cilium, Weave Net).

**Steps:**

1. **Enable NetworkPolicy Support:** Ensure your CNI plugin enforces NetworkPolicies. Flannel alone does not, so policies are silently ignored.
2. **Define NetworkPolicy Resources:**  Create YAML files specifying your desired network rules.
3. **Apply NetworkPolicies:** Apply the policies to your cluster using `kubectl apply`.

**Documentation:** [https://kubernetes.io/docs/concepts/services-networking/network-policies/](https://kubernetes.io/docs/concepts/services-networking/network-policies/)

**Explanation:** Network policies provide a powerful way to segment your cluster network and enforce traffic control rules, enhancing security.

### 45. What are some tools and techniques for debugging Kubernetes applications?

**Answer:**

**Tools and Techniques:**

- **kubectl Logs:** Inspect container logs using `kubectl logs <pod-name>`.
- **kubectl Describe:** Get detailed information about resources (Pods, Deployments, Services) using `kubectl describe <resource-type> <resource-name>`.
- **kubectl Exec:** Execute commands inside a running container for interactive debugging (`kubectl exec -it <pod-name> -- sh`; many images lack bash).
- **Port Forwarding:**  Forward a local port to a port in a Pod (`kubectl port-forward <pod-name> <local-port>:<pod-port>`).
- **Ephemeral Containers:** Attach a temporary debugging container to a running Pod (`kubectl debug -it <pod-name> --image=busybox --target=<container-name>`).

**Documentation:** [https://kubernetes.io/docs/tasks/debug-application-cluster/](https://kubernetes.io/docs/tasks/debug-application-cluster/)

**Explanation:** Start with logs and events, then move to `exec` or an ephemeral container if those are not enough.

### 46. Explain the concept of a Kubernetes context, and how do you switch between different contexts?

**Answer:**

**Kubernetes Context:**

- A context defines a cluster, a user, and a namespace for interacting with Kubernetes.
- It allows you to work with multiple clusters or namespaces from a single kubectl configuration.

**Switching Contexts:**

- **View Contexts:** `kubectl config get-contexts`
- **Switch Context:** `kubectl config use-context <context-name>`

**Example:**

```bash
# List available contexts
kubectl config get-contexts

# Switch to the "production" context
kubectl config use-context production
```

**Documentation:** [https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/](https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/)

**Explanation:**  Contexts are a convenient way to manage interactions with different Kubernetes environments without constantly needing to provide credentials or specify cluster details.

### 47.  What is the purpose of a Kubernetes LimitRange, and provide an example use case.

**Answer:**

**LimitRange:**

- A LimitRange object sets resource usage limits (CPU, memory, storage) for namespaces.
- It sets min and max bounds per Pod, container, or PersistentVolumeClaim, and default requests and limits for containers. Namespace-wide totals belong to ResourceQuota.

**Use Case:**

- **Limiting Resource Consumption in a Development Namespace:**
  - Create a LimitRange in your "development" namespace to restrict the maximum CPU and memory a single Pod can request or consume.
  - This ensures that developers don't accidentally deploy resource-intensive Pods that could impact other applications in the same namespace.

**Example:**

```yaml
apiVersion: v1
kind: LimitRange
metadata:
  name: resource-limits
spec:
  limits:
  - type: Pod
    max:
      cpu: "500m"
      memory: "2Gi"
    min:
      cpu: "100m"
      memory: "64Mi"
```

**Documentation:** [https://kubernetes.io/docs/concepts/policy/limit-range/](https://kubernetes.io/docs/concepts/policy/limit-range/)

**Explanation:** LimitRanges provide a way to establish resource consumption boundaries within namespaces, promoting fairness and preventing resource exhaustion. Use `type: Container` for defaults; `type: Pod` only sets bounds.

### 48. Describe the process of setting up a highly available Kubernetes cluster.

**Answer:**

**Setting up a highly available Kubernetes cluster involves:**

1. **Multiple Control Plane Nodes:** Provision at least 3 control plane nodes (an odd number) to eliminate single points of failure and keep etcd quorum.
2. **Load Balancing:** Put a load balancer in front of the kube-apiserver instances on the control plane nodes.
3. **etcd Replication:** Run etcd (the key-value store for Kubernetes) as a multi-member cluster, either stacked on the control plane nodes or on dedicated nodes. Each member needs its own local disk; do not place etcd on shared storage.
4. **Monitoring and Alerting:** Implement monitoring and alerting systems to detect and respond to failures quickly.

**Key Considerations:**

- **Cloud Provider or On-Premises:** Choose a deployment model (cloud-managed Kubernetes or on-premises) based on your requirements.
- **High Availability Add-ons:** Deploy highly available versions of Ingress controllers, DNS services, and other add-ons.

**Documentation:** [https://kubernetes.io/docs/setup/](https://kubernetes.io/docs/setup/)

**Explanation:** Creating a highly available cluster requires careful planning and configuration to ensure your applications can withstand component failures.

### 49. What is the difference between a node's operating system and its container runtime in the context of Kubernetes?

**Answer:**

**Node Operating System vs. Container Runtime:**

| Feature | Node Operating System | Container Runtime |
|---|---|---|
| Purpose | Provides the core system for the physical or virtual machine running the Kubernetes node. | Provides an isolated environment for running containers within a node. |
| Scope | Entire node | Individual containers |
| Examples | Linux (Ubuntu, RHEL), Windows Server | containerd, CRI-O |

**Explanation:**

- **Node OS:**  Manages hardware resources, provides system libraries, and runs the kubelet (Kubernetes agent) on each node.
- **Container Runtime:**  Handles container lifecycle management (starting, stopping, interacting with containers) within the node, using the Container Runtime Interface (CRI).
- **Docker:** Docker Engine is not a CRI runtime. Kubernetes removed dockershim in 1.24; to keep using Docker Engine, install the third-party cri-dockerd adapter.

**Documentation:** [https://kubernetes.io/docs/concepts/overview/components/](https://kubernetes.io/docs/concepts/overview/components/)

### 50. How do you back up and restore a Kubernetes cluster?

**Answer:**

**Backup and Restore Strategies:**

- **etcd Backup:** Back up the etcd data store, as it holds the cluster's state. Use `etcdctl snapshot save <file>` against a healthy member, or another backup tool.
- **Control Plane Certificates:** For kubeadm clusters, back up `/etc/kubernetes/pki` (CA, certificates, and service account keys).
- **Resource Definitions:**  Back up YAML definitions for deployments, services, and other resources. Version control (Git) is crucial here.
- **Persistent Volume Data:** Back up data stored on PersistentVolumes using appropriate tools for the underlying storage provider.

**Restoration:**

- **Restore etcd from Backup:** Restore the snapshot into a new data directory with `etcdutl snapshot restore`, then bring the control plane up on it.
- **Apply Resource Definitions:** Apply your backed-up YAML files to recreate your applications and configurations.
- **Restore Persistent Data:**  Restore data to PersistentVolumes based on your backup strategy.

**Important:**

- Regularly back up your cluster.
- Test your restore procedures to ensure they work as expected.

**Documentation:**

- etcd Backup and Restore: [https://etcd.io/docs/v3.5/op-guide/recovery/](https://etcd.io/docs/v3.5/op-guide/recovery/)

**Explanation:**  A comprehensive backup and restore strategy is essential for disaster recovery and protecting your applications and data in a Kubernetes environment.

### 51. What are the different installation methods for Kubernetes?

**Answer:**

Kubernetes offers various installation methods:

- **Minikube:**  Ideal for local development and testing on a single machine.
- **Kubeadm:** A command-line tool for creating and managing production-ready clusters.
- **Managed Kubernetes Offerings:** Services like Google Kubernetes Engine (GKE), Amazon Elastic Kubernetes Service (EKS), and Azure Kubernetes Service (AKS) provide managed Kubernetes clusters.
- **kops:**  A tool to create, destroy, upgrade, and maintain production-grade, highly available Kubernetes clusters.

**Documentation:** [https://kubernetes.io/docs/setup/](https://kubernetes.io/docs/setup/)

**Explanation:** The best installation method depends on your needs. Minikube is great for learning, while kubeadm offers more flexibility for custom setups. Managed services simplify operations, and kops is powerful for automated cluster management.

### 52. Describe the purpose and functionality of the kubelet component.

**Answer:**

The kubelet is the primary "node agent" that runs on each node in a Kubernetes cluster. Its responsibilities include:

- **Pod Management:**  Starting, stopping, and monitoring the containers within Pods according to PodSpecs.
- **Container Health Checks:** Performing liveness and readiness probes on containers.
- **Image Management:**  Pulling container images from registries as needed.
- **Resource Monitoring:**  Reporting node and container resource usage to the control plane through the API server.
- **Volume Mounting:**  Attaching and mounting storage volumes to containers.

**Documentation:** [https://kubernetes.io/docs/reference/command-line-tools-reference/kubelet/](https://kubernetes.io/docs/reference/command-line-tools-reference/kubelet/)

**Explanation:** The kubelet is essential for maintaining the desired state of Pods on each node and ensuring that containers are running as expected.

### 53. Explain the role of the API server in a Kubernetes cluster.

**Answer:**

The API server is the central control plane component that exposes the Kubernetes API.  It's responsible for:

- **Handling API Requests:**  Receiving RESTful requests from users, clients, and other cluster components.
- **Authenticating and Authorizing Requests:** Verifying the identity of the requester and ensuring they have permission to perform the requested action.
- **Managing Cluster State:** Serving the configuration and status of cluster objects (Pods, Deployments, Services, etc.). The API server is the only component that reads and writes etcd directly.
- **Validating and Persisting Data:** Ensuring that submitted API requests adhere to the Kubernetes API schema and persisting valid changes to etcd.

**Documentation:** [https://kubernetes.io/docs/concepts/overview/components/#kube-apiserver](https://kubernetes.io/docs/concepts/overview/components/#kube-apiserver)

**Explanation:** The API server is the gateway to interacting with and managing your cluster. All operations in Kubernetes are performed through the API server.

### 54.  What is a Kubernetes Custom Resource Definition (CRD), and why is it used?

**Answer:**

A CRD allows you to extend the Kubernetes API by defining your own custom resources.  These custom resources can represent any object or concept relevant to your specific needs.

**Use Cases:**

- **Representing Infrastructure:** Defining resources for databases, message queues, or other infrastructure components.
- **Creating Abstractions:**  Abstracting complex deployments or workflows as custom resources.
- **Integrating with External Systems:** Integrating Kubernetes with third-party tools or platforms.

**Example:**

You could create a CRD for a "Database" resource, allowing you to manage databases within your cluster using Kubernetes-native tools and practices.

**Documentation:** [https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/)

**Explanation:** CRDs are powerful for tailoring Kubernetes to your specific requirements, enabling you to manage a wider range of objects and workflows using familiar Kubernetes concepts.

### 55.  How do you implement a blue/green deployment strategy in Kubernetes?

**Answer:**

While Kubernetes doesn't have built-in blue/green deployments, you can achieve it with:

1. **Service and Two Deployments:**
    - Create a Service that initially points to the "blue" Deployment.
    - Deploy the "green" Deployment with the updated application.

2. **Traffic Shifting:**
    - Gradually shift traffic from the Service to the "green" Deployment using techniques like:
        - **Updating Service Selectors:** Directly modify the Service to select the new Pods.
        - **Gateway API Weighted Routing:**  Split traffic with weighted `backendRefs` in an HTTPRoute. The core Ingress API has no traffic weights.
        - **Service Mesh (Istio, Linkerd):**  Employ a service mesh for more advanced traffic management.

3. **Verification and Rollback:**
    - Monitor the "green" deployment for errors and performance.
    - If issues arise, quickly roll back traffic to the "blue" Deployment.

**Documentation:** [https://kubernetes.io/docs/concepts/workloads/controllers/deployment/](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)

**Explanation:**  Blue/green deployments minimize downtime during updates by running two identical environments, making it ideal for applications requiring high availability.

### 56. Explain the concept of container image immutability and its importance.

**Answer:**

**Container Image Immutability:**

- Means that once a container image is built, it should not be modified.
- Any changes to the application code or dependencies require building a new image with a different tag or digest.

**Importance:**

- **Consistency and Reproducibility:**  Ensures that the same image will always produce the same container environment, regardless of where or when it's deployed.
- **Security:** Reduces the risk of unauthorized modifications to container images, improving supply chain security.
- **Rollback Capabilities:**  Facilitates easier rollbacks by deploying a previous, known-good image version.

**Documentation:** While not a dedicated page, immutability is a core concept discussed throughout Kubernetes documentation, especially in relation to image management and security.

**Explanation:**  Tags are mutable, so reference images by digest (`image@sha256:...`) when you need an exact guarantee.

### 57. What are some strategies for managing secrets securely in Kubernetes?

**Answer:**

**Secret Management Strategies:**

- **Kubernetes Secrets:**  Keep sensitive values out of Pod specs and images. By default, Secrets are only base64-encoded, not encrypted.
- **Secrets Encryption at Rest:**  Configure an `EncryptionConfiguration` for the kube-apiserver, preferably with a KMS provider. Existing Secrets stay unencrypted until they are rewritten.
- **External Secrets Management Solutions:** Integrate with dedicated secrets management solutions like HashiCorp Vault, AWS Secrets Manager, or Azure Key Vault.
- **Secrets Rotation:**  Regularly rotate secrets to limit the impact of any potential compromise.
- **Limit Secret Access:**  Use RBAC to restrict which users and applications can access specific Secrets.

**Documentation:** [https://kubernetes.io/docs/concepts/configuration/secret/](https://kubernetes.io/docs/concepts/configuration/secret/)

**Explanation:** Base64 is encoding, not protection. Combine encryption at rest with RBAC.

### 58. Describe the purpose of a Kubernetes Horizontal Pod Autoscaler (HPA).

**Answer:**

**HPA Functionality:**

- Automatically scales the number of Pods in a Deployment, ReplicaSet, or StatefulSet based on observed CPU utilization, memory usage, or other custom metrics.

**How it Works:**

1. **Metric Collection:**  The HPA observes resource metrics collected by the Metrics Server or other monitoring systems.
2. **Target Utilization:** You define a target CPU utilization or other metric values.
3. **Scaling Decisions:**  The HPA calculates the desired number of replicas based on the target utilization and the observed metrics.
4. **Pod Scaling:** The HPA instructs the Deployment or other controller to scale the number of Pods accordingly.

**Documentation:** [https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/)

**Explanation:**  CPU and memory utilization targets require metrics-server and CPU or memory `requests` on the containers. Without requests, the HPA cannot compute a utilization percentage.

### 59.  What is a Kubernetes PodDisruptionBudget (PDB), and when would you use it?

**Answer:**

**PDB Purpose:**

- Ensures that a minimum number or percentage of Pods in a Deployment, ReplicaSet, or StatefulSet are always available during voluntary disruptions like upgrades, cluster maintenance, or node drains.

**Use Cases:**

- **High Availability:**  Maintain application availability during planned disruptions.
- **Graceful Degradation:** Ensure a minimum level of service even when some Pods are unavailable.

**How it Works:**

- You define the minimum number or percentage of Pods that must remain available.
- When a disruption occurs, Kubernetes checks if the PDB's requirements are met before proceeding.
- If not, the disruption might be delayed or blocked to maintain the desired availability.

**Documentation:** [https://kubernetes.io/docs/concepts/workloads/pods/disruptions/](https://kubernetes.io/docs/concepts/workloads/pods/disruptions/)

**Explanation:** PDBs apply only to voluntary disruptions that go through the Eviction API, such as `kubectl drain`. They do not prevent node failures or direct Pod deletion.

### 60. How do you implement resource quotas at the namespace level in Kubernetes?

**Answer:**

**Resource Quotas:**

- Allow administrators to limit the total amount of resources (CPU, memory, storage, object counts) that can be requested or consumed within a namespace.

**Implementation:**

1. **Create a ResourceQuota object:** Define the desired resource limits for the namespace in a YAML file.
2. **Apply the ResourceQuota:** Apply the quota to the namespace using `kubectl apply -f <quota-file.yaml> -n <namespace>`.

**Example:**

```yaml
apiVersion: v1
kind: ResourceQuota
metadata:
  name: my-namespace-quota
spec:
  hard:
    requests.cpu: "2" # Total CPU request limit
    requests.memory: "4Gi" # Total memory request limit
```

**Documentation:** [https://kubernetes.io/docs/concepts/policy/resource-quotas/](https://kubernetes.io/docs/concepts/policy/resource-quotas/)

**Explanation:**  Quotas cap total usage per namespace. Once a quota tracks `requests.cpu` or `requests.memory`, Pods without those requests are rejected unless a LimitRange supplies defaults.

### 61. Explain the concept of a sidecar container in a Kubernetes Pod, and provide an example use case.

**Answer:**

**Sidecar Container:**

- A container in a Pod that runs alongside the main application container but performs a supporting or auxiliary function.
- Shares the Pod's network namespace and volumes with the main container.

**Use Case:**

- **Log Aggregation:**  A sidecar container can collect logs from the main container and send them to a centralized logging system.

**Example:**

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  containers:
  - name: my-app # Main application container
    image: my-app-image
  - name: log-collector # Sidecar container
    image: log-collector-image
    volumeMounts:
    - name: shared-logs
      mountPath: /var/log/app
  volumes:
  - name: shared-logs
    emptyDir: {}
```

**Explanation:** Sidecar containers add supporting services without modifying the main application container. Since Kubernetes 1.33, a sidecar can also be declared as an init container with `restartPolicy: Always`, so it starts before the app containers and keeps running alongside them.

### 62. What is a Kubernetes Operator, and what are its benefits?

**Answer:**

**Kubernetes Operator:**

- A software extension to Kubernetes that uses Custom Resource Definitions (CRDs) to manage applications and their components as a single unit.
- Automates operational tasks like deployment, scaling, backups, and upgrades based on domain-specific knowledge.

**Benefits:**

- **Automation:**  Reduces manual operations and simplifies management of complex applications.
- **Self-Healing:** Operators can automatically detect and recover from failures, improving application resilience.
- **Version Management:**  Handles upgrades and rollbacks of applications gracefully.
- **Domain-Specific Knowledge:**  Embeds operational expertise into the Operator, making it easier for developers to manage applications.

**Documentation:** [https://kubernetes.io/docs/concepts/extend-kubernetes/operator/](https://kubernetes.io/docs/concepts/extend-kubernetes/operator/)

**Explanation:**  Operators bring automation and self-service capabilities to Kubernetes, enabling declarative management of complex applications.

### 63. Describe the difference between ephemeral and persistent storage in Kubernetes.

**Answer:**

| Feature | Ephemeral Storage | Persistent Storage |
|---|---|---|
| Lifecycle | Tied to the Pod lifecycle. Survives container restarts, but is deleted when the Pod is removed from its node. | Exists independently of containers and Pods. Persists data even if Pods are deleted or rescheduled. |
| Use Cases | Temporary files, caches, data that can be regenerated. | Databases, logs, configuration files, user-uploaded content. |
| Examples | `emptyDir` volumes, container image layers |  `hostPath` volumes (with caution), PersistentVolumes, cloud-managed disks |

**Explanation:** Choose storage based on how long the data must outlive the Pod.

### 64. How do you configure a Kubernetes Service to perform health checks on its backend Pods?

**Answer:**

Use the `readinessProbe` field in the Pod template of your Deployment or other controller. The kubelet runs the probe, and a Pod that fails it is removed from its Service's endpoints. The Service itself does not run health checks.

**Example (HTTP Readiness Probe):**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
# ... other deployment configurations ...
spec:
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
      - name: my-container
        image: my-image:1.0
        readinessProbe:
          httpGet:
            path: /healthz
            port: 8080
          initialDelaySeconds: 15
          periodSeconds: 20
```

**Explanation:**

- **`httpGet`:** Specifies an HTTP GET request to the `/healthz` path on port 8080 of the container.
- **`initialDelaySeconds`:**  Waits for 15 seconds after the container starts before performing the first probe.
- **`periodSeconds`:**  Performs the probe every 20 seconds.

**Documentation:** [https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)

### 65.  What is the purpose of a Kubernetes init container, and how is it different from a regular container?

**Answer:**

| Feature | Init Container | Regular Container |
|---|---|---|
| Execution Order | Runs to completion **before** any regular containers in the Pod start. | Starts only after all init containers have completed successfully. |
| Purpose | Setup work such as waiting for dependencies, running database migrations, or downloading configuration files. | Runs the main application logic. |
| Failure Handling | Retried by the kubelet under the Pod's `restartPolicy`. The app containers do not start until it succeeds. | Restarted under the Pod's `restartPolicy`. A failure does not stop sibling regular containers. |

**Documentation:** [https://kubernetes.io/docs/concepts/workloads/pods/init-containers/](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/)

**Explanation:**  Init containers ensure that the necessary setup steps are performed in a predictable order before the main application starts.

### 66. Describe the process of configuring and using a ConfigMap in a Kubernetes Deployment.

**Answer:**

**Configuring and Using ConfigMaps:**

1. **Create a ConfigMap:**  Define your configuration data in a YAML file or using `kubectl create configmap`.

   **Example (YAML):**

   ```yaml
   apiVersion: v1
   kind: ConfigMap
   metadata:
     name: my-config
   data:
     database.url: "https://mydatabase.example.com"
     log.level: "info"
   ```

2. **Mount the ConfigMap as a Volume:** In your Deployment's Pod template, mount the ConfigMap as a volume.

   ```yaml
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: my-deployment
   # ... other deployment configurations ...
   spec:
     selector:
       matchLabels:
         app: my-app
     template:
       metadata:
         labels:
           app: my-app
       spec:
         containers:
         - name: my-container
           image: my-image:1.0
           volumeMounts:
           - name: config-volume
             mountPath: /etc/config
         volumes:
         - name: config-volume
           configMap:
             name: my-config
   ```

3. **Access Configuration Data:** Your application can access the configuration data from the mounted volume.

   **Example (In the container):**

   ```bash
   # Read the database URL from the ConfigMap
   DATABASE_URL=$(cat /etc/config/database.url)
   ```

**Documentation:** [https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/)

**Explanation:** ConfigMaps provide a way to separate configuration from container images, making your applications more portable and configurable. Store credentials in a Secret instead.

### 67. Explain the different types of Kubernetes probes and their purposes.

**Answer:**

**Kubernetes Probes:**

| Probe Type | Purpose | Action on Failure |
|---|---|---|
| **Liveness Probe** | Checks if the container is **running** as expected. | Restarts the container. |
| **Readiness Probe** | Checks if the container is **ready to serve traffic**. | Removes the Pod from the Service's endpoints, preventing traffic from being routed to it. |
| **Startup Probe** | Checks if the application within the container has **started successfully** (used for slow-starting applications). |  Restarts the container. |

**Probe Mechanisms:**

- **HTTP:** Sends an HTTP GET request to a specified endpoint.
- **TCP:** Attempts to open a TCP connection to a specified port.
- **gRPC:** Calls the gRPC health checking service on a port (stable since Kubernetes 1.27).
- **Command:** Executes a command inside the container.

**Documentation:** [https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)

**Explanation:**  A failing liveness probe restarts the container, while a failing readiness probe only removes the Pod from Service endpoints. Use a startup probe to hold off liveness checks during slow starts.

### 68.  Explain the difference between `kubectl exec` and `kubectl logs` commands.

**Answer:**

| Command | Purpose |
|---|---|
| `kubectl exec` | Executes a command **inside a running container** within a Pod. |
| `kubectl logs` | Retrieves the **logs** generated by a container within a Pod. |

**Examples:**

```bash
# Execute the "ls -l" command inside the "my-container" container in the "my-pod" Pod
kubectl exec -it my-pod -c my-container -- ls -l

# Get the logs from the "my-container" container in the "my-pod" Pod
kubectl logs my-pod -c my-container
```

**Use Cases:**

- `kubectl exec`: Useful for interactive debugging, troubleshooting, or running one-time commands within a container.
- `kubectl logs`:  Essential for monitoring application behavior, diagnosing errors, and gathering information about container activity.

**Documentation:**

- `kubectl exec`: [https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#exec](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#exec)
- `kubectl logs`:  [https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#logs](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#logs)

### 69.  How do you configure a Pod to use a specific Docker image from a private registry?

**Answer:**

1. **Create a Kubernetes Secret:**  Store your private registry credentials (username, password) as a Secret in Kubernetes.

   ```bash
   kubectl create secret docker-registry my-registry-secret \
   --docker-server=<your-registry-server> \
   --docker-username=<your-username> \
   --docker-password=<your-password>
   ```

2. **Reference the Secret in Your Pod Definition:** In your Pod spec, under `imagePullSecrets`, reference the Secret you created.

   ```yaml
   apiVersion: v1
   kind: Pod
   metadata:
     name: my-pod
   spec:
     containers:
     - name: my-container
       image: <your-private-registry>/my-image:tag
     imagePullSecrets:
     - name: my-registry-secret
   ```

**Explanation:**

- The `imagePullSecrets` field tells Kubernetes to use the specified Secret to authenticate with your private registry when pulling the image.
- The Secret must be in the same namespace as the Pod. Otherwise the Pod events show `FailedToRetrieveImagePullSecret`.

**Documentation:** [https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/)

### 70.  What is a Kubernetes Ingress resource, and how does it differ from a Service?

**Answer:**

| Feature | Service | Ingress |
|---|---|---|
| Layer | L4 (TCP/UDP) | L7 (HTTP/HTTPS) |
| Purpose | Exposes Pods on a stable virtual IP and port. | Routes external HTTP/HTTPS traffic to different Services based on rules. |
| Features | Load balancing and service discovery | Virtual hosting (multiple domains), path-based routing, TLS termination |
| Controller Required | Not required for ClusterIP. Type LoadBalancer needs a cloud or load balancer provider. | Requires an Ingress controller (e.g., Traefik, HAProxy Ingress). It is not built into the cluster. |

**Explanation:**

- **Services:** Provide basic internal and external access to Pods.
- **Ingress:** Extends Services to offer more sophisticated traffic management for HTTP/HTTPS traffic from outside the cluster. The Ingress API is frozen, and Gateway API is the recommended successor. ingress-nginx was retired in March 2026, so choose another controller.

**Documentation:**

- Service: [https://kubernetes.io/docs/concepts/services-networking/service/](https://kubernetes.io/docs/concepts/services-networking/service/)
- Ingress: [https://kubernetes.io/docs/concepts/services-networking/ingress/](https://kubernetes.io/docs/concepts/services-networking/ingress/)

### 71. Explain the concept of a Kubernetes Deployment rollout strategy.

**Answer:**

**Rollout Strategies:**

- **RollingUpdate (default):**
  - Gradually replaces Pods with updated versions.
  - Provides fine-grained control over the update process with `maxSurge` (maximum number of Pods created above the desired state) and `maxUnavailable` (maximum number of Pods unavailable during the update). Both default to 25%.

- **Recreate:**
  - Deletes all old Pods before creating new ones.
  - Introduces downtime during the update.
  - Suitable for applications where old and new versions cannot coexist.

- **Blue/Green (requires additional tools):**
  - Creates a new "green" deployment alongside the "blue."
  - Switches traffic over to "green" when it's ready.
  - Offers zero downtime but requires careful planning.

**Documentation:** [https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#deployment-strategies](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#deployment-strategies)

**Explanation:** Recreate is the only built-in strategy with downtime. Choose it only when old and new versions cannot run side by side.

### 72. How do you troubleshoot container image pull limits in a Kubernetes cluster?

**Answer:**

**Troubleshooting Image Pull Limits:**

1. **Read the events:** Run `kubectl describe pod <pod-name>`. `ErrImagePull` and `ImagePullBackOff` mean the kubelet is failing and retrying the pull.
2. **Registry Rate Limits:** A `toomanyrequests` event means the registry throttled the node, as Docker Hub does for anonymous pulls. Authenticate with `imagePullSecrets` or pull through a mirror.
3. **ImagePullSecrets:** Verify that the correct Secret is attached to the Pod and lives in the same namespace. A `FailedToRetrieveImagePullSecret` event means it is missing or misnamed.
4. **Network Connectivity:** Ensure that nodes can reach and resolve the registry host.
5. **Image Name and Tag:** A typo in the image name or tag causes the same retry loop.
6. **LimitRange and ResourceQuota:** These do not affect image pulls. They govern CPU, memory, and object counts, so changing them will not fix a pull error.

**Documentation:** [https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/)

**Explanation:**  Most pull failures come from credentials, registry throttling, or network access, not from Kubernetes quotas.

### 73.  Describe the purpose and use cases for Kubernetes annotations.

**Answer:**

**Annotations:**

- **Key-Value Pairs:**  Provide a way to attach **non-identifying metadata** to Kubernetes objects (Pods, Deployments, Services).
- **Informational or Operational:**  Used for:
  - **Adding Notes or Descriptions:** Provide context or information about the object.
  - **Tooling and Automation:** Configure tools, build pipelines, or automation systems.
  - **Tool-managed state:**  Records written by tools and controllers, such as `kubectl.kubernetes.io/last-applied-configuration`.

**Examples:**

- Adding a description to a Deployment:  `annotations: {"description": "Deployment for the frontend application"}`
- Setting the Ingress class (legacy annotation, deprecated in 1.18):  `annotations: {"kubernetes.io/ingress.class": "nginx"}` - prefer the `spec.ingressClassName: nginx` field on the Ingress resource itself

**Documentation:** [https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/](https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/)

**Explanation:**  Unlike labels (which are used for selection), annotations provide a flexible way to attach metadata for various purposes without affecting object behavior.

### 74. Explain the difference between a stable, beta, and alpha API version in Kubernetes.

**Answer:**

**API Version Stability Levels:**

| Level | Description | Use in Production |
|---|---|---|
| **Stable (v1)** | APIs are finalized and unlikely to change; backwards compatibility is a high priority. | **Recommended** |
| **Beta (v1beta1, v2beta1, etc.)** | APIs are still evolving; breaking changes are possible between versions (e.g., v1beta1 to v1beta2). | Use with caution; test thoroughly. |
| **Alpha (v1alpha1, v2alpha1, etc.)** | APIs are experimental and may change significantly; no stability or compatibility guarantees. Often disabled by default. | **Not recommended** for production. |

**Documentation:** [API versioning](https://kubernetes.io/docs/reference/using-api/#api-versioning)

**Explanation:** Check the stability level before relying on an API version, since beta and alpha changes can break manifests after an upgrade.

### 75. How do you configure a Kubernetes Pod to run on a specific node?

**Answer:**

Use **Node Affinity** or **Node Selectors** in your Pod definition.

**Node Selectors (Simpler, Less Flexible):**

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  containers:
  - name: my-container
    image: my-image
  nodeSelector:
    disktype: ssd # Match nodes with the label "disktype: ssd"
```

**Node Affinity (More Powerful, Can Be Complex):**

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  containers:
  - name: my-container
    image: my-image
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:  # Pod must be scheduled on a matching node
        nodeSelectorTerms:
        - matchExpressions:
          - key: kubernetes.io/hostname
            operator: In
            values:
            - node-1 # Match the node with hostname "node-1"
```

**Documentation:** [https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/)

**Explanation:**  Both mechanisms allow you to constrain which nodes a Pod can be scheduled on, but Node Affinity offers more advanced matching options.

### 76.  What is a Kubernetes Headless Service, and when would you use it?

**Answer:**

**Headless Service:**

- A Service with the `clusterIP` field set to `None`.
- It does not allocate a ClusterIP address and does not perform load balancing.

**Use Cases:**

- **Stateful Applications:** Exposing each Pod in a StatefulSet with a unique DNS name. The StatefulSet's `serviceName` must match this Service.
- **Peer-to-Peer Communication:** Facilitating direct communication between Pods without going through a Service's IP.
- **Custom Service Discovery:** Implementing your own service discovery mechanism.

**Example:**

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-headless-service
spec:
  clusterIP: None
  selector:
    app: my-stateful-app
```

**Documentation:** [https://kubernetes.io/docs/concepts/services-networking/service/#headless-services](https://kubernetes.io/docs/concepts/services-networking/service/#headless-services)

**Explanation:** Headless Services are useful for scenarios where you need more control over networking or when you don't need traditional Service load balancing.

### 77.  Describe the process of setting up a private Docker registry within a Kubernetes cluster.

**Answer:**

**Setting Up a Private Registry:**

1. **Choose a Registry Image:** Select a Docker registry image (e.g., `registry:2`).
2. **Create a Deployment:** Deploy the registry image as a Deployment in your Kubernetes cluster.
3. **Persistent Storage:**  Use a PersistentVolumeClaim, backed by a PersistentVolume or StorageClass, to store the registry's images.
4. **Service (Optional):**  Create a Service to expose the registry within the cluster.
5. **Ingress (Optional):** Use an Ingress to make the registry accessible from outside the cluster (if needed).
6. **Secure with TLS:**  Obtain and configure SSL/TLS certificates to secure communication with the registry.
7. **Authentication (Optional):**  Implement authentication mechanisms for pushing and pulling images.

**Documentation:** [https://distribution.github.io/distribution/about/deploying/](https://distribution.github.io/distribution/about/deploying/)

**Explanation:**  Running your own registry within Kubernetes gives you more control over image storage and access.

### 78. What is a Kubernetes NetworkPolicy, and how does it enhance cluster security?

**Answer:**

**NetworkPolicy:**

- A Kubernetes object that defines rules for network traffic allowed to and from Pods in a specific namespace.
- Acts as a firewall at the Pod level, controlling communication between Pods, namespaces, and external networks.

**Enhancing Security:**

- **Microsegmentation:** Divides the cluster network into isolated segments, limiting the blast radius of security breaches.
- **Least Privilege:**  Enforces the principle of least privilege by allowing only necessary communication.
- **Ingress/Egress Control:** Specifies allowed incoming (ingress) and outgoing (egress) traffic for Pods.
- **Default Deny:**  You can configure default deny policies, requiring explicit rules to allow traffic, improving security posture.

**Documentation:** [https://kubernetes.io/docs/concepts/services-networking/network-policies/](https://kubernetes.io/docs/concepts/services-networking/network-policies/)

**Explanation:**  NetworkPolicies take effect only if the cluster's network plugin enforces them (for example, Calico or Cilium). A Pod that no policy selects accepts all traffic.

### 79. Explain the concept of a Kubernetes ServiceAccount token, and describe its security implications.

**Answer:**

**ServiceAccount Token:**

- A JWT (JSON Web Token) that Kubernetes issues to each Pod through a projected volume. Since Kubernetes 1.24, no long-lived token Secret is created automatically.
- Used for authenticating Pod requests to the Kubernetes API server.

**Security Implications:**

- **Access Control:**  ServiceAccount tokens grant Pods the permissions associated with the linked ServiceAccount. Securely manage ServiceAccount permissions using RBAC.
- **Token Rotation:** Projected tokens are time-limited, and the kubelet refreshes them before they expire, which limits the impact of a leaked token.
- **Token Storage:**  The token is mounted at `/var/run/secrets/kubernetes.io/serviceaccount/token`. Anyone who can read that file or exec into the Pod can use it.
- **Minimize Exposure:**  Set `automountServiceAccountToken: false` on Pods or ServiceAccounts that never call the API.
- **Auditing and Monitoring:**  Monitor API server logs and audit events related to ServiceAccount token usage to detect suspicious activity.

**Documentation:** [https://kubernetes.io/docs/concepts/security/service-accounts/](https://kubernetes.io/docs/concepts/security/service-accounts/)

**Explanation:** ServiceAccount tokens are essential for Pod authentication but require careful management to maintain cluster security.

### 80. How do you configure a Pod to use a pre-existing persistent volume claim?

**Answer:**

1. **Existing PVC:**  Make sure you have a PersistentVolumeClaim (PVC) in the same namespace as the Pod you want to create.

2. **Pod Definition:** In your Pod specification, add a `volumes` section to mount the PVC:

   ```yaml
   apiVersion: v1
   kind: Pod
   metadata:
     name: my-pod
   spec:
     containers:
     - name: my-container
       image: my-image
       volumeMounts:
       - mountPath: /data
         name: my-pvc-volume
     volumes:
     - name: my-pvc-volume
       persistentVolumeClaim:
         claimName: existing-pvc-name
   ```

**Explanation:**

- **`volumes`:** Defines the volumes used by the Pod.
- **`persistentVolumeClaim`:** Specifies that the volume source is a PVC.
- **`claimName`:**  Provide the name of the existing PVC you want to use.

**Documentation:** [https://kubernetes.io/docs/concepts/storage/persistent-volumes/](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)

### 81. What is the difference between `kubectl port-forward` and `kubectl proxy`?

**Answer:**

| Feature | `kubectl port-forward` | `kubectl proxy` |
|---|---|---|
| Scope | Forwards a single port from a Pod or Service to your local machine. | Creates a proxy server on your local machine that forwards all requests to the Kubernetes API server. |
| Use Cases | Accessing a service in a Pod that is not exposed externally; debugging applications inside a Pod. | Interacting with the Kubernetes API from your local machine or scripts. |
| Example | `kubectl port-forward my-pod 8080:80` (forwards port 80 in the Pod to port 8080 on your local machine) | `kubectl proxy --port=8080` (creates a proxy server on localhost:8080) |

**Documentation:**

- `kubectl port-forward`: [https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/](https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/)
- `kubectl proxy`: [https://kubernetes.io/docs/reference/kubectl/generated/kubectl_proxy/](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_proxy/)

### 82.  How do you configure a Service to expose a Deployment on a specific port range?

**Answer:**

A Service cannot expose a range of ports in a single entry - each entry in the `ports` array takes a single integer `port`, `targetPort`, and (for `NodePort`) `nodePort`. To expose multiple ports, list them as separate entries. `nodePort` values must fall in the cluster's NodePort range, which is 30000-32767 by default (set with the kube-apiserver `--service-node-port-range` flag), and `nodePort` is only allowed on `NodePort` and `LoadBalancer` Services.

**Example:**

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  type: NodePort
  selector:
    app: my-app
  ports:
  - name: http
    port: 8080 # External port (single port)
    targetPort: 80   # Target port on the Pod
  - name: https
    port: 8443 # Another external port
    targetPort: 443  # Target port on the Pod
    nodePort: 30036 # NodePort for this entry (NodePort type only)
```

**Explanation:**

- **`port`:** The port on the Service that external clients will connect to.
- **`targetPort`:**  The port on the Pod that the Service forwards traffic to.
- **`nodePort`:** The port on each Node that exposes the Service externally (for `NodePort` type Services).

**Documentation:** [https://kubernetes.io/docs/concepts/services-networking/service/](https://kubernetes.io/docs/concepts/services-networking/service/)

### 83. Explain the concept of a Kubernetes namespace and its relation to RBAC.

**Answer:**

**Namespaces and RBAC:**

- **Resource Isolation:** Namespaces provide a logical boundary for resources (Pods, Deployments, Services). Cluster-scoped resources such as Nodes and PersistentVolumes are not namespaced.
- **RBAC Scope:** Role-Based Access Control (RBAC) policies can be applied at the namespace level, controlling access to resources within that namespace.

**How They Work Together:**

- **Roles and RoleBindings:**  You define Roles (sets of permissions) and RoleBindings (which grant those permissions to users or groups) within a specific namespace.
- **Access Control:** When a user or application interacts with Kubernetes resources, RBAC checks if they have the necessary permissions within the targeted namespace.

**Example:**

- Create a namespace called "development."
- Define a Role called "developer" that has permissions to create and manage Deployments in the "development" namespace.
- Create a RoleBinding that grants the "developer" role to a specific user or group.

**Documentation:**

- Namespaces: [https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/)
- RBAC: [https://kubernetes.io/docs/reference/access-authn-authz/rbac/](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)

### 84. How do you configure a Kubernetes deployment to perform automated rollouts during container image updates?

**Answer:**

Kubernetes Deployments handle automated rollouts by default using the `RollingUpdate` strategy.

**Key Configuration Options:**

- **`imagePullPolicy: Always`:**  Ensures that the latest image is always pulled from the registry during deployments and updates.

- **`.spec.strategy.rollingUpdate`:** Fine-tune the rollout behavior:
  - **`maxSurge`:**  The maximum number of Pods that can be created above the desired number of replicas during the update. (e.g., `25%`, `1`)
  - **`maxUnavailable`:**  The maximum number of Pods that can be unavailable during the update. (e.g., `25%`, `0`)

**Example:**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
      - name: my-container
        image: my-image:latest
        imagePullPolicy: Always
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
```

**Explanation:**

- A rollout starts only when the Pod template changes, such as a new image reference. Pushing a new image under the same `:latest` tag leaves the template unchanged, so no rollout starts; use unique tags or `kubectl rollout restart`.
- At most, one extra Pod (`25%` of `3` replicas) will be created during the update.
- No Pods can be unavailable: `25%` of `3` rounds down to `0` for `maxUnavailable`, so old Pods are removed only after new ones are ready.

**Documentation:** [https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#updating-a-deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#updating-a-deployment)

### 85. What are some common troubleshooting steps for a Kubernetes Pod that is stuck in a "CrashLoopBackOff" state?

**Answer:**

**Troubleshooting "CrashLoopBackOff":**

1. **View Pod Logs:**

   ```bash
   kubectl logs <pod-name>
   kubectl logs <pod-name> --previous   # output of the last crashed container
   ```

   - Look for error messages, exceptions, or stack traces within the container logs.

2. **Describe the Pod:**

   ```bash
   kubectl describe pod <pod-name>
   ```

   - Check the "Events" section for clues about why the container might be crashing.

3. **Exec into the Pod (if possible):**

   ```bash
   kubectl exec -it <pod-name> -- bash
   ```

   - If the container is starting and then crashing, you might be able to exec into it briefly to inspect files, run commands, or debug further.

4. **Check Resource Limits:**
   - Check `Last State` in the describe output for `Reason: OOMKilled` (exit code 137), and raise the memory limit if the container exceeds it.

5. **Application Errors:**
   - Review the application code for potential bugs, configuration issues, or dependencies that might be causing crashes.

**Documentation:** [https://kubernetes.io/docs/tasks/debug/debug-application/debug-running-pod/](https://kubernetes.io/docs/tasks/debug/debug-application/debug-running-pod/)

### 86. Explain the concept of a Kubernetes PersistentVolume (PV) and its lifecycle.

**Answer:**

**PersistentVolume (PV):**

- A piece of storage provisioned by an administrator in a Kubernetes cluster.
- Represents a storage resource, similar to a "hard drive," that can be attached to Pods.

**PV Lifecycle:**

1. **Provisioning:**  An administrator creates a PV statically, or it is created dynamically from a StorageClass.
2. **Available:**  The PV is ready to be claimed by a PersistentVolumeClaim (PVC).
3. **Bound:**  A PVC requests storage, and a matching PV is bound to it.
4. **Released:** When the PVC is deleted, the PV moves to Released. Its data stays on the volume, and the PV cannot be bound to a new claim until it is reclaimed.
5. **Reclaim:**  The `persistentVolumeReclaimPolicy` decides what happens next. `Retain` keeps the PV and its data for manual cleanup; `Delete` removes the PV and the underlying storage. If automatic reclaim fails, the PV enters the `Failed` phase.

**Documentation:** [https://kubernetes.io/docs/concepts/storage/persistent-volumes/](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)

### 87. How do you implement role-based access control (RBAC) for users in a Kubernetes cluster?

**Answer:**

**RBAC Implementation:**

1. **Create Roles:**  Define Roles that specify the allowed actions (verbs) on specific resources (e.g., Pods, Deployments).

2. **Create RoleBindings:**  Create RoleBindings that grant Roles to users or groups.

3. **(Optional) ClusterRoles and ClusterRoleBindings:**  For cluster-wide permissions, use ClusterRoles and ClusterRoleBindings instead of Roles and RoleBindings.

4. **Verify:**  Check the result with `kubectl auth can-i get pods --as=jane -n default`.

**Example:**

```yaml
# Role for viewing Pods in the "default" namespace
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: pod-reader
  namespace: default
rules:
- apiGroups: [""] # "" indicates the core API group
  resources: ["pods"]
  verbs: ["get", "list", "watch"]

---
# RoleBinding to grant the "pod-reader" role to user "jane"
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: read-pods
  namespace: default
subjects:
- kind: User
  name: jane
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: pod-reader
  apiGroup: rbac.authorization.k8s.io
```

**Documentation:** [https://kubernetes.io/docs/reference/access-authn-authz/rbac/](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)

### 88. Describe the purpose and benefits of using a Kubernetes ServiceMesh.

**Answer:**

**Service Mesh:**

- A dedicated infrastructure layer for managing service-to-service communication in a microservices architecture.
- Typically implemented as a network proxy (sidecar) alongside your applications. Some implementations, such as Istio ambient mode, use per-node proxies instead.

**Benefits:**

- **Traffic Management:** Routing, load balancing, retries, timeouts.
- **Security:** Encryption (mTLS), authentication, authorization.
- **Observability:**  Metrics, tracing, logging.
- **Resiliency:** Circuit breaking, fault injection, canary deployments.

**Popular Service Meshes:**

- Istio
- Linkerd
- Consul (service mesh)

**Documentation:** Kubernetes has no dedicated service mesh page. See the [Istio documentation](https://istio.io/latest/docs/) and the [Linkerd documentation](https://linkerd.io/).

**Explanation:**  A mesh moves networking logic such as mTLS and retries out of application code, so the same policies apply to every service.

### 89. How do you configure a Kubernetes Deployment to use a specific container image pull policy?

**Answer:**

Use the `imagePullPolicy` field in the container specification of your Deployment's Pod template.

**Image Pull Policies:**

- **`Always`:**  Always pull the image from the registry, even if it exists locally.
- **`IfNotPresent`:**  Pull the image only if it is not present locally. This is the default for images with a specific tag. When the tag is `:latest` or omitted, the default is `Always`.
- **`Never`:** Never pull the image. Use only the local image, if available.

**Example:**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
# ... other deployment configurations ...
spec:
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
      - name: my-container
        image: my-image:tag
        imagePullPolicy: Always
```

**Documentation:** [https://kubernetes.io/docs/concepts/containers/images/#updating-images](https://kubernetes.io/docs/concepts/containers/images/#updating-images)

### 90. Explain the purpose and functionality of the Kubernetes scheduler.

**Answer:**

**Kubernetes Scheduler:**

- A control plane component responsible for assigning Pods to nodes.
- It ensures that Pods are placed on nodes with sufficient resources and that other constraints (like affinity/anti-affinity, taints/tolerations) are met.

**Scheduling Process:**

1. **Pod Creation:** When a Pod is created without a node assignment, the scheduler selects a suitable node. Pods that already set `spec.nodeName` skip scheduling.
2. **Filtering:**  The scheduler filters nodes that meet the Pod's resource requests and other constraints (affinity, taints).
3. **Scoring:**  The remaining nodes are scored by plugins. The defaults include NodeResourcesFit (`LeastAllocated` by default, which favors nodes with the most free resources) and ImageLocality (favors nodes that already have the image).
4. **Binding:** The Pod is bound to the node with the highest score.

**Documentation:** [https://kubernetes.io/docs/concepts/scheduling-eviction/kube-scheduler/](https://kubernetes.io/docs/concepts/scheduling-eviction/kube-scheduler/)

**Explanation:** Placement is based on Pod resource requests, not live usage, so accurate `requests` values matter.

### 91. What are some common causes of resource contention in a Kubernetes cluster, and how do you mitigate them?

**Answer:**

**Resource Contention:**  Occurs when multiple Pods or applications compete for limited resources (CPU, memory, network bandwidth, storage IOPS) on a node or within a cluster.

**Common Causes:**

- **Insufficient Resource Requests/Limits:** Pods without resource requests or with very high limits can consume excessive resources.
- **Overcommitting Resources:**  The scheduler places Pods by their requests, but limits can add up to more than node capacity, so bursts lead to starvation.
- **"Noisy Neighbors":**  Pods running resource-intensive tasks that impact other Pods on the same node.
- **Storage Bottlenecks:**  Multiple Pods accessing the same storage volume with high I/O demands.

**Mitigation Strategies:**

- **Resource Quotas:**  Limit resource consumption at the namespace level.
- **LimitRanges:**  Set default resource requests and limits for Pods in a namespace.
- **PriorityClasses:**  Give critical Pods a higher `priorityClassName` so they are scheduled first and can preempt lower-priority Pods.
- **Resource Requests and Limits:**  Define appropriate resource requests and limits for all Pods.
- **Quality of Service (QoS) Classes:** Kubernetes assigns Guaranteed, Burstable, or BestEffort based on requests and limits. These classes determine eviction order under node pressure.
- **Node Affinity/Anti-affinity:**  Control Pod placement to avoid scheduling conflicting applications on the same node.
- **Monitoring and Alerting:**  Proactively monitor resource usage and set up alerts for potential contention issues.

**Documentation:** [https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) (and related pages on Resource Quotas, QoS)

### 92. Describe the purpose and use cases for Kubernetes taints and tolerations.

**Answer:**

**Taints and Tolerations:**

- **Taints:**  Node properties (in `key=value:effect` form, distinct from labels) that repel Pods unless the Pods tolerate them.
- **Tolerations:**  Properties added to Pods that allow them to tolerate node taints.

**Use Cases:**

- **Dedicated Nodes:** Reserve nodes for specific applications or teams.
- **Node Maintenance:**  Evict Pods from nodes undergoing maintenance.
- **Hardware Requirements:**  Schedule Pods that require specific hardware (GPUs, high-performance disks) on appropriate nodes.

**How They Work:**

- A node with a taint will repel Pods unless the Pods have a matching toleration.
- Taint effects: `NoSchedule` blocks new Pods without a matching toleration; `PreferNoSchedule` is a soft version; `NoExecute` also evicts running Pods without a toleration. `tolerationSeconds` sets how long a Pod can stay after a `NoExecute` taint is added.
- Tolerations allow Pods to "tolerate" the taint and be scheduled on the node.

**Example:**

- **Taint a node:**  `kubectl taint nodes node1 app=special:NoSchedule`
- **Add a toleration to a Pod:**

   ```yaml
   apiVersion: v1
   kind: Pod
   metadata:
     name: my-pod
   spec:
     containers:
     - name: my-container
       image: my-image
     tolerations:
     - key: "app"
       operator: "Equal"
       value: "special"
       effect: "NoSchedule"
   ```

**Documentation:** [https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/)

### 93. How do you configure a Pod to use a specific DNS server in Kubernetes?

**Answer:**

You can specify custom DNS settings at the Pod level using the `dnsPolicy` and `dnsConfig` fields in your Pod specification.

**Example:**

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  containers:
  - name: my-container
    image: my-image
  dnsPolicy: "None"  # Use custom DNS settings
  dnsConfig:
    nameservers:
      - "192.168.1.100" # IP address of your custom DNS server
    searches:
      - "mydomain.local"
    options:
      - name: ndots
        value: "2"
```

**Explanation:**

- **`dnsPolicy: "None"`:**  Tells Kubernetes to ignore cluster DNS settings and use the `dnsConfig` provided.
- **`dnsConfig`:**
  - **`nameservers`:**  A list of IP addresses for your custom DNS servers.
  - **`searches`:** (Optional) A list of DNS search domains.
  - **`options`:**  (Optional) Additional DNS options.

To keep cluster DNS and only add nameservers or search domains, use `dnsPolicy: ClusterFirst` with `dnsConfig`; the entries are merged into the generated configuration.

**Documentation:** [https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/)

### 94. What are some security best practices for container images used in Kubernetes?

**Answer:**

**Container Image Security:**

- **Use Trusted Images:** Obtain images from reputable sources (e.g., Docker Hub official images, your private registry).
- **Image Scanning:** Scan images for vulnerabilities and malware using tools like Trivy or Grype.
- **Image Signing:**  Sign images to verify their integrity and authenticity, for example with Sigstore cosign.
- **Least Privilege:**  Run containers as a non-root user to limit the impact of potential exploits.
- **Security Contexts:**  Define Security Contexts to control container privileges and access to resources within the Pod.
- **Network Policies:**  Implement Network Policies to restrict container network communication.
- **Secrets Management:**  Never store secrets directly in container images. Use Kubernetes Secrets or external secrets management solutions.
- **Regular Updates:**  Keep images up-to-date with the latest security patches.

**Documentation:** [https://kubernetes.io/docs/concepts/security/](https://kubernetes.io/docs/concepts/security/)

### 95. Explain the difference between a deployment update and a deployment rollout in Kubernetes.

**Answer:**

**Deployment Update vs. Rollout:**

| Term | Description |
|---|---|
| **Deployment Update** | The act of modifying a Deployment's desired state (e.g., changing the image, updating replicas, modifying configurations). |
| **Deployment Rollout** | The process by which Kubernetes implements the changes specified in a Deployment update.  This process follows the configured rollout strategy (e.g., RollingUpdate, Recreate). |

**In simpler terms:**

- **Update:** "What" you want to change.
- **Rollout:** "How" Kubernetes applies that change.

**Example:**

- You update a Deployment to use a new container image.
- Kubernetes performs a rollout to replace the Pods with the updated image, following the defined rollout strategy.
- Watch progress with `kubectl rollout status deployment/<name>`.

**Documentation:** [https://kubernetes.io/docs/concepts/workloads/controllers/deployment/](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)

### 96. How do you monitor the events happening within a Kubernetes cluster?

**Answer:**

**Monitoring Kubernetes Events:**

1. **kubectl get events:**

   ```bash
   kubectl get events --all-namespaces
   ```

   - Lists events across all namespaces (or use `-n <namespace>` for a specific namespace). Events expire after one hour by default (kube-apiserver `--event-ttl`), so export them if you need history.

2. **kubectl describe:**

   ```bash
   kubectl describe pod <pod-name>
   ```

   - The "Events" section of the output for resources like Pods, Deployments, and ReplicaSets provides details about events related to those resources.

3. **Event Logging and Monitoring Tools:**
   - Kubernetes does not forward events off-cluster by itself. Run an event exporter that sends them to a centralized logging system (e.g., Elasticsearch, Splunk) for long-term storage and analysis.
   - Use monitoring tools (Prometheus, Datadog, Grafana) to visualize event data and create alerts.

**Documentation:**

- Events: [https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/event-v1/](https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/event-v1/)

**Explanation:**  Events are short-lived and informational, so use them alongside metrics and logs rather than as a replacement.

### 97. What are some common strategies for implementing disaster recovery in a Kubernetes environment?

**Answer:**

**Disaster Recovery Strategies:**

- **Multi-Region Deployments:**
  - Deploy your applications across multiple geographic regions in the cloud or across multiple data centers.
  - Use DNS failover or a global load balancer to direct traffic to the healthy region.

- **Backups and Restoration:**
  - Regularly back up your cluster state (etcd, for example with `etcdctl snapshot save`), application data (PersistentVolumes), and configuration files (for example with Velero).
  - Test your restoration procedures to ensure you can recover quickly.

- **Infrastructure as Code (IaC):**
  - Define your cluster and application infrastructure using tools like Terraform or CloudFormation.
  - Quickly rebuild your environment in case of a disaster.

- **Disaster Recovery Drills:**
  - Conduct regular drills to test your disaster recovery plan and identify areas for improvement.

**Documentation:** [Backing up an etcd cluster](https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/). Cloud provider disaster recovery documentation is also relevant.

### 98. How do you configure a Service to distribute traffic evenly across Pods using a different algorithm than the default?

**Answer:**

By default, kube-proxy spreads connections across ready endpoints at random. Setting `sessionAffinity: ClientIP` pins each client to one Pod instead. A Service has no field that selects a load-balancing algorithm. The options are: (1) the kube-proxy `--ipvs-scheduler` flag in IPVS mode, which applies cluster-wide; (2) `spec.trafficDistribution` (for example `PreferSameZone`), which prefers nearby endpoints but does not pick an algorithm; (3) a service mesh or Gateway/ingress controller, which can set per-route algorithms. The `externalTrafficPolicy` field controls how external traffic reaches Pods (`Local` keeps the client IP and routes only to local Pods; `Cluster` masks the client IP), and `spec.type` selects how the Service is exposed.

**Example (Using `LoadBalancer` type and `Local` traffic policy):**

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-loadbalancer-service
spec:
  type: LoadBalancer
  externalTrafficPolicy: Local
  selector:
    app: my-app
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080
```

**Explanation:**

- **`type: LoadBalancer`:**  This tells Kubernetes to create a LoadBalancer.
- **`externalTrafficPolicy: Local`:** This sends external traffic only to Pods on the node that receives it. Nodes without a local Pod fail the load balancer's health check.

**Documentation:** [https://kubernetes.io/docs/concepts/services-networking/service/](https://kubernetes.io/docs/concepts/services-networking/service/)

### 99. Explain the purpose and use cases for Kubernetes Resource Limits.

**Answer:**

**Purpose of Resource Limits:**

- Resource Limits define the maximum amount of resources (CPU, memory) that a container can consume.
- They prevent resource starvation by ensuring that one container cannot monopolize resources needed by others.
- CPU above the limit is throttled; memory above the limit gets the container OOMKilled.

**Use Cases:**

- **Predictable Resource Allocation:**  Guarantee that critical applications have access to the resources they need.
- **Preventing Resource Exhaustion:**  Avoid situations where one misbehaving application consumes all available resources.
- **Cost Control:**  In cloud environments, limits help prevent runaway costs by restricting resource usage.

**Example:**

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: resource-limit-demo
spec:
  containers:
  - name: my-container
    image: nginx
    resources:
      limits:
        cpu: "500m" # Container cannot use more than 0.5 CPU cores
        memory: "256Mi" # Container cannot use more than 256 MiB of memory
```

**Documentation:** [https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/)

### 100. What are the different ways to access the Kubernetes API from outside the cluster?

**Answer:**

**Accessing the Kubernetes API Externally:**

- **kubectl:** Configure `kubectl` with the cluster's kubeconfig file to interact with the API from your local machine or a remote server.
- **API Client Libraries:** Use language-specific client libraries (e.g., Go, Python, Java) to programmatically interact with the API.
- **HTTP REST API:**  The Kubernetes API is RESTful, so you can make HTTP requests to the API server using tools like `curl` or web browser extensions.
- **Service Account Tokens:**  Applications running inside the cluster can use Service Account tokens to authenticate with the API server.

**Security Considerations:**

- **Authentication:** Always use strong authentication mechanisms like TLS client certificates or bearer tokens.
- **Authorization:** Implement RBAC to control access to API resources.
- **Network Security:**  Secure the network connection between the client and the API server, ideally using a VPN or dedicated network link.

**Documentation:** [https://kubernetes.io/docs/reference/kubernetes-api/](https://kubernetes.io/docs/reference/kubernetes-api/)

### 101.  Describe the process of creating and using a Kubernetes StorageClass.

**Answer:**

**Creating and Using StorageClasses:**

1. **Define a StorageClass:** Create a YAML file defining the StorageClass, including the provisioner (the plugin that provisions storage) and parameters.

   ```yaml
   apiVersion: storage.k8s.io/v1
   kind: StorageClass
   metadata:
     name: fast-storage
   provisioner: ebs.csi.aws.com # AWS EBS CSI driver (the in-tree provisioner was removed in 1.27)
   parameters:
     type: gp3
     fsType: ext4
   ```

2. **Create the StorageClass:** Apply the YAML file to create the StorageClass:

   ```bash
   kubectl apply -f storageclass.yaml
   ```

3. **Use the StorageClass in a PVC:**  In your PersistentVolumeClaim (PVC), specify the StorageClass:

   ```yaml
   apiVersion: v1
   kind: PersistentVolumeClaim
   metadata:
     name: my-pvc
   spec:
     accessModes:
       - ReadWriteOnce
     resources:
       requests:
         storage: 1Gi
     storageClassName: fast-storage # Use the created StorageClass
   ```

**Documentation:** [https://kubernetes.io/docs/concepts/storage/storage-classes/](https://kubernetes.io/docs/concepts/storage/storage-classes/)

### 102. Explain the concept of "Quality of Service" (QoS) classes for Pods in Kubernetes.

**Answer:**

**QoS Classes:**

- QoS classes define the priority of Pods when it comes to resource allocation and eviction.

**Types of QoS Classes:**

- **Guaranteed:**
  - Highest priority.
  - Every container sets CPU and memory requests equal to its limits; the Pod gets exactly what it requests.
  - Suitable for critical applications.
- **Burstable:**
  - Medium priority.
  - Pods can use more resources than requested if available but might be evicted if resources are scarce.
  - Suitable for applications that can tolerate some resource fluctuations.
- **BestEffort:**
  - Lowest priority.
  - Pods make no resource requests or limits.
  - They use any leftover resources and are the first to be evicted when resources are insufficient.
  - Suitable for batch jobs or non-critical tasks.

**Documentation:** [https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#quality-of-service-classes](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#quality-of-service-classes)

### 103. How do you configure a Pod to run as a non-root user for security purposes?

**Answer:**

**Running Pods as Non-Root:**

1. **Specify User and Group IDs in the Dockerfile:** When building your container image, use the `USER` instruction in your Dockerfile to specify the user and group IDs that the container should run as.

2. **Set `runAsUser` and `runAsGroup` in the Pod Spec:**  In your Kubernetes Pod specification, set the `securityContext.runAsUser` and `securityContext.runAsGroup` fields to the desired user and group IDs.

**Example:**

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: security-context-demo
spec:
  securityContext:
    runAsUser: 1000 # Run as user with ID 1000
    runAsGroup: 1000 # Run as group with ID 1000
    runAsNonRoot: true # Kubelet refuses to start the container if its image runs as UID 0
  containers:
  - name: my-container
    image: my-secure-image
```

**Documentation:** [https://kubernetes.io/docs/tasks/configure-pod-container/security-context/](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/)

### 104. What are the key differences between a StatefulSet and a Deployment in Kubernetes?

**Answer:**

| Feature | StatefulSet | Deployment |
|---|---|---|
| **Purpose** | Manages stateful applications (e.g., databases) |  Manages stateless applications |
| **Pod Identity** | Each Pod has a unique, stable network identity (hostname, ordinal index) | Pods are interchangeable |
| **Storage** |  Uses PersistentVolumes to provide persistent storage | Storage is typically ephemeral (unless PersistentVolumes are explicitly used) |
| **Scaling** |  Scaled up and down in order by default (`OrderedReady`; `Parallel` is optional) | Scaled up and down arbitrarily |
| **Updates** |  Performed in a graceful, ordered manner |  Updates can be rolled out or recreated |

**Documentation:**

- StatefulSet: [https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/)
- Deployment: [https://kubernetes.io/docs/concepts/workloads/controllers/deployment/](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)

### 105. Explain the purpose and functionality of a Kubernetes EndpointSlice.

**Answer:**

**EndpointSlice:**

- A Kubernetes object (beta in 1.17, GA in 1.21) that represents a subset of endpoints (IP addresses and ports) for a Service. It replaces the older Endpoints API for this purpose.
- EndpointSlices distribute the endpoint information, improving scalability and performance, especially in large clusters.

**Purpose:**

- **Scalability:**  Addresses the issue of large Services with many endpoints putting a strain on the Kubernetes control plane.
- **Performance:**  Speeds up endpoint updates and service discovery by dividing endpoints into smaller, manageable chunks.

**Functionality:**

- When a Service is created, Kubernetes creates EndpointSlice objects that map to subsets of the Service's endpoints.
- Kube-proxy and other networking components use EndpointSlices to route traffic to Pods.

**Documentation:** [https://kubernetes.io/docs/concepts/services-networking/endpoint-slices/](https://kubernetes.io/docs/concepts/services-networking/endpoint-slices/)

### 106. How do you configure a Pod to use a specific network interface on the node?

**Answer:**

While Kubernetes doesn't directly allow specifying a network interface within a Pod definition, you can achieve this using:

- **Host Networking (Not Recommended for Multi-Tenant Environments):**
  - Set `hostNetwork: true` in the Pod spec.
  - The Pod shares the host's network namespace, giving it access to all interfaces.
  - **Security Risks:** Pods can potentially interfere with other processes on the host.

- **Multus CNI Plugin (More Flexible and Secure):**
  - Install the Multus CNI plugin in your cluster.
  - Define multiple network attachments in your Pod specification using annotations.
  - Each network named in the annotation needs a matching `NetworkAttachmentDefinition` object.

**Example (Multus):**

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: multus-demo
  annotations:
    k8s.v1.cni.cncf.io/networks: '[
        { "name": "my-network-1" },
        { "name": "my-network-2", "interface": "eth1" }
      ]'
spec:
  containers:
  - name: my-container
    image: nginx
```

**Documentation:**

- Host Networking: [https://kubernetes.io/docs/concepts/security/pod-security-standards/](https://kubernetes.io/docs/concepts/security/pod-security-standards/)
- Multus CNI: [https://github.com/k8snetworkplumbingwg/multus-cni](https://github.com/k8snetworkplumbingwg/multus-cni)

### 107.  What is a Kubernetes Admission Controller, and describe its role in cluster security.

**Answer:**

**Admission Controllers:**

- Admission controllers are plugins that intercept requests to the Kubernetes API server before persisting changes to etcd.
- They act as gatekeepers, enforcing security policies and validating resource configurations.

**Role in Cluster Security:**

- **Policy Enforcement:** Enforce security best practices by:
  - Preventing Pods from running as root (Pod Security Admission, `runAsNonRoot`).
  - Requiring resource requests and limits (for example, with `ValidatingAdmissionPolicy`).
  - Validating container image sources.
- **Configuration Validation:** Ensure that resources are created with valid settings:
  - Check for required labels or annotations.
  - Enforce naming and label conventions.
  - Validate resource quotas.

**Commonly Used Admission Controllers:**

- `LimitRanger`
- `ResourceQuota`
- `PodSecurity` (Pod Security Admission; replaces PodSecurityPolicy, which was removed in Kubernetes 1.25)
- `ImagePolicyWebhook`

**Documentation:** [https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/](https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/)

### 108. How do you configure a Kubernetes Service to use a specific external IP address?

**Answer:**

You can assign a specific external IP address to a Kubernetes Service of type `LoadBalancer` by providing the `loadBalancerIP` field in the Service definition.

> **Note:** `spec.loadBalancerIP` is deprecated since Kubernetes 1.24 and some providers ignore it. Prefer the provider-specific annotation for the load balancer IP, or the Gateway API.

**Example:**

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-loadbalancer-service
spec:
  type: LoadBalancer
  loadBalancerIP: "192.168.1.100"  # Specify the desired external IP
  selector:
    app: my-app
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080
```

**Important Considerations:**

- **Cloud Provider Support:** Not all cloud providers support assigning a specific external IP address. Check your cloud provider's documentation.
- **IP Address Availability:** Ensure that the specified IP address is available and not already in use within your cloud environment.

**Documentation:** [https://kubernetes.io/docs/concepts/services-networking/service/#loadbalancer](https://kubernetes.io/docs/concepts/services-networking/service/#loadbalancer)

### 109. Explain the concept of "affinity" in Kubernetes scheduling and its different types.

**Answer:**

**Affinity in Kubernetes Scheduling:**

- Affinity rules allow you to control Pod placement by specifying preferences or constraints on which nodes Pods can or cannot be scheduled.

**Types of Affinity:**

- **Node Affinity:**
  - **`requiredDuringSchedulingIgnoredDuringExecution`:** (Hard Affinity)  A Pod *must* be scheduled on a node that matches the specified rules.
  - **`preferredDuringSchedulingIgnoredDuringExecution`:**  (Soft Affinity) The scheduler tries to schedule the Pod on a matching node but may schedule it on a non-matching node if no suitable matches are available.

- **Pod Affinity and Anti-affinity:**
  - **`podAffinity`:**  (Co-locate Pods) Prefers or requires Pods to be scheduled in the same topology domain (node, zone, region, or any custom `topologyKey`) as other Pods that match certain labels.
  - **`podAntiAffinity`:** (Separate Pods)  Prefers or requires Pods to be scheduled in different topology domains from other Pods that match certain labels.

**Documentation:** [https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity)

### 110. How do you perform a rolling update of a Kubernetes Deployment using a canary deployment strategy?

**Answer:**

**Canary Deployment with Deployments:**

1. **Create a canary Deployment:** Keep the current Deployment as the stable track. Create a second Deployment with the new image, the same shared label (for example `app: my-app`), and a small `replicas` value (e.g., 1 or 2). One Deployment cannot run two versions at different ratios, so two Deployments are needed.

2. **Route traffic to both:** The Service selector matches only the shared label, so requests are spread roughly in proportion to Pod count.

3. **Monitor the Canary:** Closely monitor the canary Pods for errors, performance regressions, or unexpected behavior. Use metrics, logs, and other observability tools.

4. **Shift the Ratio:** If the canary is healthy, scale the canary up and the stable Deployment down (e.g., to 25%, then 50%).

5. **Complete the Rollout:** Once you're confident, scale the canary Deployment to the full replica count and delete the old Deployment.

**Note:** Core Kubernetes has no built-in canary feature, and replica-based canaries cannot target exact traffic percentages. For weighted traffic, use a service mesh, Gateway API weighted backends, or a progressive delivery controller such as Argo Rollouts or Flagger.

### 111. What are some key considerations when designing a multi-tenant Kubernetes cluster?

**Answer:**

**Multi-Tenancy Considerations:**

- **Resource Isolation:**
  - Use namespaces to isolate resources (Pods, Services, etc.) for each tenant.
  - Implement resource quotas to prevent one tenant from consuming excessive resources.
  - Enforce Pod Security Standards per namespace with Pod Security Admission (for example, the `pod-security.kubernetes.io/enforce: restricted` label).

- **Network Segmentation:**
  - Use Network Policies to control network traffic between tenants and limit the impact of security breaches.
  - Consider using different network plugins or network namespaces for stronger isolation.

- **Access Control:**
  - Implement RBAC with fine-grained permissions to restrict tenant access to only their resources and namespaces.
  - Use separate authentication and authorization mechanisms for each tenant if needed.

- **Image Security:**
  - Enforce image security policies to ensure that tenants use trusted and scanned container images.
  - Consider setting up a dedicated image registry for each tenant.

- **Monitoring and Logging:**
  - Provide tenants with tools to monitor and log their own applications and resources.
  - Implement centralized logging and monitoring for cluster-level visibility.

**Documentation:** [https://kubernetes.io/docs/concepts/security/multi-tenancy/](https://kubernetes.io/docs/concepts/security/multi-tenancy/)

### 112. Describe the purpose and functionality of the Kubernetes Container Runtime Interface (CRI).

**Answer:**

**Container Runtime Interface (CRI):**

- CRI is a plugin interface that enables Kubernetes to use different container runtimes without modifying the core Kubernetes codebase.
- It allows for flexibility and innovation in the container runtime ecosystem.

**Functionality:**

- **Abstraction Layer:**  CRI defines a standard set of APIs for container lifecycle management (creating, starting, stopping, deleting containers), image management, and resource isolation.
- **Runtime Plugins:**  Container runtimes (like containerd or CRI-O) implement the CRI APIs. Docker Engine is no longer supported directly (dockershim was removed in Kubernetes 1.24); it works only through the cri-dockerd adapter.
- **kubelet Integration:**  The kubelet interacts with container runtimes through the CRI, issuing commands and receiving status updates.
- **Checking the runtime:** `kubectl get nodes -o wide` shows each node's runtime in the CONTAINER-RUNTIME column.

**Benefits:**

- **Flexibility:** Choose the best container runtime for your needs.
- **Innovation:**  Facilitates the development and adoption of new container runtimes.
- **Decoupling:** Reduces dependencies between Kubernetes and specific runtime implementations.

**Documentation:** [https://kubernetes.io/docs/concepts/architecture/cri/](https://kubernetes.io/docs/concepts/architecture/cri/)

### 113.  How do you configure a Kubernetes Pod to use a custom hostname without modifying the container image?

**Answer:**

Use the `hostname` and `subdomain` fields in the Pod specification.

**Example:**

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  hostname: my-custom-hostname
  subdomain: my-app # Optional; must match the name of a headless Service
  containers:
  - name: my-container
    image: nginx
```

**Explanation:**

- **`hostname`:** Sets the hostname of the Pod. This hostname is used within the Pod's network namespace.
- **`subdomain`:** (Optional) Sets the Pod's DNS subdomain. A DNS record (`<hostname>.<subdomain>.<namespace>.svc.cluster.local`) is published only if a headless Service with the same name as `subdomain` selects the Pod.

**Documentation:** [https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/)

### 114. What are some strategies for implementing zero-downtime deployments in Kubernetes?

**Answer:**

**Zero-Downtime Deployment Strategies:**

- **Rolling Updates (with Proper Configuration):**
  - Use the `RollingUpdate` deployment strategy with appropriate `maxSurge` and `maxUnavailable` settings to ensure that there are always Pods available to handle traffic during the update.

- **Blue/Green Deployments:**
  - Create a duplicate "green" environment alongside the existing "blue" environment.
  - Route traffic to the "green" environment after it's verified, then decommission the "blue" environment.

- **Canary Deployments:**
  - Gradually shift traffic to a small set of "canary" Pods running the new version.
  - If the canary is healthy, increase traffic to the new version and phase out the old version.

- **Service Mesh (Advanced Traffic Management):**
  - Utilize a service mesh like Istio or Linkerd to perform sophisticated traffic routing, allowing for blue/green, canary deployments, and other advanced deployment patterns.

**Key Considerations:**

- **Readiness Probes:** Use readiness probes to ensure that Pods are only added to the load balancer pool when they are ready to serve traffic.
- **Graceful Shutdown:** Handle SIGTERM in the application, or add a `preStop` hook, and size `terminationGracePeriodSeconds` so in-flight requests finish before the Pod is removed.
- **Monitoring and Observability:**  Closely monitor deployments and have robust alerting in place to quickly detect and address issues.

**Documentation:** While Kubernetes doesn't have a single "zero-downtime deployment" feature, its documentation covers the concepts and techniques needed to achieve zero downtime through strategies like RollingUpdates, Services, and Ingress.

### 115. Explain the purpose and functionality of a Kubernetes Custom Resource Definition (CRD) controller.

**Answer:**

**CRD Controllers:**

- A CRD controller is a custom Kubernetes controller that extends the cluster's API to manage custom resources defined by Custom Resource Definitions (CRDs).

**Purpose:**

- **Custom Resource Management:**  CRD controllers implement the logic for creating, updating, deleting, and managing the lifecycle of your custom resources.
- **Automation:**  Automate operational tasks related to your custom resources, such as provisioning infrastructure, scaling applications, or reacting to events.

**Functionality:**

1. **Watch for Events:**  The controller continuously watches the Kubernetes API server for events related to your custom resource (e.g., creation, updates, deletions).
2. **Process Events:**  When an event occurs, the controller's logic determines the appropriate actions to take.
3. **Interact with the Kubernetes API:**  The controller uses the Kubernetes API to perform actions (e.g., create Pods, Services, or other resources) based on the state of your custom resources.

**Documentation:** [https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/)

### 116.  How do you configure a Kubernetes Service to route traffic based on HTTP headers?

**Answer:**

The core `Ingress` and `Service` APIs cannot match on HTTP headers. Use the Gateway API `HTTPRoute`, which supports header matches natively, or a controller-specific feature.

**Example (Gateway API HTTPRoute):**

> **Note:** The community Ingress NGINX project was retired in March 2026 and receives no further security fixes. For new setups, consider the [Gateway API](https://gateway-api.sigs.k8s.io/) or another maintained controller.

<!-- skip-validate -->
```yaml
apiVersion: gateway.networking.k8s.io/v1
kind: HTTPRoute
metadata:
  name: header-routing
spec:
  parentRefs:
  - name: my-gateway # An existing Gateway
  hostnames:
  - example.com
  rules:
  - matches:
    - headers:
      - name: X-Env
        value: beta
    backendRefs:
    - name: beta-service
      port: 80
  - backendRefs: # Default route for all other requests
    - name: stable-service
      port: 80
```

Requests with the header `X-Env: beta` go to `beta-service`; all other requests go to `stable-service`.

**Documentation:**

- HTTPRoute: [https://kubernetes.io/docs/concepts/services-networking/gateway/#httproute](https://kubernetes.io/docs/concepts/services-networking/gateway/#httproute)
- Ingress: [https://kubernetes.io/docs/concepts/services-networking/ingress/](https://kubernetes.io/docs/concepts/services-networking/ingress/)

### 117. How do you troubleshoot a Kubernetes Service that is not routing traffic to its backend Pods?

**Answer:**

**Troubleshooting Service Routing:**

1. **Check Service Type and Endpoints:**
   - Verify the Service type (`ClusterIP`, `NodePort`, `LoadBalancer`).
   - Use `kubectl get endpointslices -l kubernetes.io/service-name=<service-name>` to ensure that the Service has endpoints (backend Pods).

2. **Verify Pod Labels and Selectors:**
   - Make sure the Pod labels match the Service's selector. Use `kubectl get pods -l <selector>` and `kubectl describe service <service-name>`.
   - Confirm the Service `targetPort` matches the port the container listens on (`kubectl get service <service-name> -o yaml`).

3. **Inspect Pod Status:**
   - Check if the Pods are running and in a "Ready" state: `kubectl get pods`.
   - View Pod logs for errors: `kubectl logs <pod-name>`.

4. **NetworkPolicy Restrictions:**
   - Ensure that Network Policies are not blocking traffic to the Pods. Check with `kubectl describe networkpolicy -n <namespace>`.

5. **DNS Resolution (for Services):**
   - Confirm that the Service name can be resolved to its ClusterIP address: `nslookup <service-name>`.

6. **Kube-proxy Issues:**
   - Check that kube-proxy (or your CNI's kube-proxy replacement) is running on every node and has programmed rules. This applies to every Service type, including `ClusterIP`.

7. **Cloud Provider Issues (for LoadBalancer):**
   - For `LoadBalancer` Services, ensure the load balancer is properly provisioned and configured in your cloud environment.

**Documentation:** [https://kubernetes.io/docs/tasks/debug-application-cluster/debug-service/](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-service/)

### 118. Describe the purpose and benefits of using a Kubernetes Ingress Controller.

**Answer:**

**Ingress Controller:**

- An Ingress Controller is a specialized load balancer that works at Layer 7 (HTTP/HTTPS) to route external traffic to services within your Kubernetes cluster.

**Purpose:**

- **Manage External Access:**  Provides a single entry point for external traffic to reach services in your cluster.
- **Traffic Routing:** Routes traffic based on rules defined in Ingress resources, including hostnames and paths. Header-based rules depend on the controller.
- **TLS Termination:** Offloads SSL/TLS encryption and decryption, simplifying certificate management.

**Benefits:**

- **Simplified Configuration:**  Use Ingress resources (YAML files) to define routing rules, making it easy to manage traffic.
- **Flexibility and Features:** Ingress Controllers offer features like virtual hosting and path-based routing. Header-based routing is controller-specific.
- **Improved Security:**  Centralize TLS/SSL termination and apply security policies at the Ingress Controller level.

> The Ingress API is frozen; new routing features are being added to the Gateway API.

**Documentation:** [https://kubernetes.io/docs/concepts/services-networking/ingress/](https://kubernetes.io/docs/concepts/services-networking/ingress/)

### 119. Explain the concept of a Kubernetes container lifecycle hook and its different phases.

**Answer:**

**Container Lifecycle Hooks:**

- Lifecycle hooks let a container run code at two points: right after it starts (`PostStart`) and right before it terminates (`PreStop`).

**Phases:**

- **`PostStart`:**
  - Executed immediately *after* a container is created. There is no guarantee it finishes before the container's ENTRYPOINT runs.
  - Useful for tasks like:
    - Running one-time setup scripts.
    - Sending notifications about container startup.
- **`PreStop`:**
  - Executed immediately *before* a container is terminated (due to a deployment update, scaling down, or other reasons).
  - Allows for graceful shutdown tasks:
    - Deregistering from service discovery.
    - Closing database connections.
    - Performing cleanup operations.
  - The hook counts against `terminationGracePeriodSeconds` (default 30 seconds).

**Implementation:**

- Define lifecycle hooks in the `lifecycle` section of the container spec, using an `exec` or `httpGet` handler.

**Documentation:** [https://kubernetes.io/docs/concepts/containers/container-lifecycle-hooks/](https://kubernetes.io/docs/concepts/containers/container-lifecycle-hooks/)

### 120.  How do you configure resource requests and limits for init containers in Kubernetes?

**Answer:**

You configure resource requests and limits for init containers in the same way as regular containers, using the `resources` field in the init container's specification.

**Example:**

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  initContainers:
  - name: init-mydb
    image: busybox:1.36
    command: ["sh", "-c", "until nslookup my-db; do sleep 2; done"]
    resources:
      requests:
        cpu: "100m"
        memory: "128Mi"
      limits:
        cpu: "200m"
        memory: "256Mi"
  containers:
  - name: my-app
    image: my-app-image
```

**Explanation:**

- **`requests`:** Used by the scheduler to place the Pod. The init container is guaranteed at least this amount while it runs.
- **`limits`:** The maximum the init container may use.
- Init containers run one at a time. The scheduler reserves the larger of the highest init container request and the sum of the regular container requests.

**Documentation:** [https://kubernetes.io/docs/concepts/workloads/pods/init-containers/](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/)

### 121.  What are the different ways to pass environment variables to containers in Kubernetes?

**Answer:**

**Passing Environment Variables:**

1. **`env` Field (Key-Value Pairs):**

   ```yaml
   apiVersion: v1
   kind: Pod
   metadata:
     name: my-pod
   spec:
     containers:
     - name: my-container
       image: my-image
       env:
       - name: DATABASE_URL
         value: "postgres://mydb.example.com:5432/app"
   ```

   `env` entries can also take a value from a ConfigMap or Secret with `valueFrom` (`configMapKeyRef` or `secretKeyRef`).

2. **`envFrom` Field (From ConfigMaps or Secrets):**

   ```yaml
   apiVersion: v1
   kind: Pod
   metadata:
     name: my-pod
   spec:
     containers:
     - name: my-container
       image: my-image
       envFrom:
       - configMapRef:
           name: my-config-map
       - secretRef:
           name: my-secret
   ```

3. **Command Line Arguments:**

   ```yaml
   apiVersion: v1
   kind: Pod
   metadata:
     name: my-pod
   spec:
     containers:
     - name: my-container
       image: my-image
       env:
       - name: DATABASE_URL
         value: "postgres://mydb.example.com:5432/app"
       command: ["my-app", "--database-url=$(DATABASE_URL)"]
   ```

**Documentation:** [https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/](https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/)

### 122.  Explain the purpose and functionality of Kubernetes kube-proxy.

**Answer:**

**kube-proxy:**

- kube-proxy is a network proxy that runs on each node in a Kubernetes cluster.
- It maintains network rules on the node to ensure that network traffic is routed correctly to Pods and Services.

**Purpose:**

- **Service Discovery and Load Balancing:**  kube-proxy watches Service and EndpointSlice objects and programs iptables, IPVS or nftables rules to:
  - Direct traffic to the correct Pods backing a Service.
  - Load balance traffic across multiple Pods.
- **Expose Services Externally:** For `NodePort` and `LoadBalancer` services, kube-proxy configures rules to make services accessible from outside the cluster.

**Functionality:**

1. **Watch for Changes:** kube-proxy watches the API server for changes to Services and EndpointSlices, which it uses by default for endpoint data.
2. **Update Network Rules:**  Based on changes, kube-proxy updates iptables, IPVS or nftables rules on the node to reflect the correct routing information.
3. **Traffic Forwarding:**  Network traffic is forwarded according to the configured rules.

**Documentation:** [https://kubernetes.io/docs/concepts/services-networking/service/#proxy-mode](https://kubernetes.io/docs/concepts/services-networking/service/#proxy-mode)

### 123.  What are some strategies for implementing a blue/green deployment using an Ingress Controller?

**Answer:**

**Blue/Green with Ingress:**

1. **Create Separate Ingress Resources:** Define two Ingress resources, one for the "blue" (existing) deployment and one for the "green" (new) deployment. Both use the same host; the green Ingress is marked as a canary so the controller splits traffic between them.

2. **Configure Ingress Controller:**  Configure your Ingress Controller (e.g., Nginx Ingress) to route traffic based on the Ingress rules.

3. **Deploy Green Deployment:** Deploy the "green" deployment alongside the "blue" deployment.

4. **Switch Traffic:**  Update the Ingress resource or Ingress Controller configuration to point traffic to the "green" deployment.

**Example (Using Nginx Ingress and Annotations):**

> **Note:** The community Ingress NGINX project was retired in March 2026 and receives no further security fixes. For new setups, consider the [Gateway API](https://gateway-api.sigs.k8s.io/) or another maintained controller.

```yaml
# Blue Ingress (initially active)
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: app-blue
  annotations:
    nginx.ingress.kubernetes.io/canary: "false"
spec:
  ingressClassName: nginx
  rules:
  - host: app.example.com
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: app-blue
            port:
              number: 80

---
# Green Ingress (initially inactive, same host)
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: app-green
  annotations:
    nginx.ingress.kubernetes.io/canary: "true"
    nginx.ingress.kubernetes.io/canary-weight: "0" # Initially no traffic
spec:
  ingressClassName: nginx
  rules:
  - host: app.example.com
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: app-green
            port:
              number: 80
```

**Documentation:**

- Ingress: [https://kubernetes.io/docs/concepts/services-networking/ingress/](https://kubernetes.io/docs/concepts/services-networking/ingress/)
- Nginx Ingress (retired in March 2026, example for annotations): [https://kubernetes.github.io/ingress-nginx/](https://kubernetes.github.io/ingress-nginx/)

### 124.  How do you configure a Pod to have access to the host's file system in Kubernetes?

**Answer:**

**Accessing the Host File System (Use with Caution):**

1. **`hostPath` Volume:**  Use a `hostPath` volume to mount a specific directory from the host node's file system into the Pod.

**Example:**

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: hostpath-volume-demo
spec:
  containers:
  - name: my-container
    image: nginx
    volumeMounts:
    - mountPath: /data
      name: host-volume
  volumes:
  - name: host-volume
    hostPath:
      path: /var/lib/data # Directory on the host to mount
      type: Directory
```

**Security Considerations:**

- **Security Risks:** `hostPath` volumes can pose significant security risks, as containers can potentially modify or delete important files on the host.
- **Limited Portability:**  Pods using `hostPath` are not portable across different nodes or clusters, as they rely on a specific directory structure on the host.

**Documentation:** [https://kubernetes.io/docs/concepts/storage/volumes/#hostpath](https://kubernetes.io/docs/concepts/storage/volumes/#hostpath)

### 125.  How do you configure a Pod to use a specific DNS policy in Kubernetes?

**Answer:**

Use the `dnsPolicy` field in your Pod specification to control how DNS settings are applied to a Pod.

**DNS Policy Options:**

- **`ClusterFirst` (default):** Uses the cluster's internal DNS service (CoreDNS in most clusters).
- **`Default`:** Inherits DNS settings from the node where the Pod is scheduled (the host's `/etc/resolv.conf`).
- **`ClusterFirstWithHostNet`:**  For Pods with `hostNetwork: true`. Cluster names resolve through cluster DNS, and other names resolve through the node's upstream nameservers.
- **`None`:** Ignores Kubernetes-provided DNS settings and uses the `dnsConfig` section in the Pod spec to define custom DNS.

**Example:**

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  containers:
  - name: my-container
    image: my-image
  dnsPolicy: "ClusterFirst" # Use cluster DNS
```

To ignore the cluster DNS settings and define your own, use `None` with `dnsConfig`:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod-custom-dns
spec:
  containers:
  - name: my-container
    image: my-image
  dnsPolicy: "None"
  dnsConfig:
    nameservers:
    - 10.0.0.53
    searches:
    - corp.example.com
    options:
    - name: ndots
      value: "2"
```

**Documentation:** [https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/)

### 126. What are some strategies for securing secrets at rest in Kubernetes?

**Answer:**

**Securing Secrets at Rest:**

- **Enable etcd Encryption:**  Encrypt the Kubernetes cluster's etcd data store at rest, which includes Secret data. Set it up with an `EncryptionConfiguration` file that the kube-apiserver loads through `--encryption-provider-config`.
- **Use External Secrets Management Solutions:**
  - Store secrets in dedicated secrets management solutions like HashiCorp Vault, AWS Secrets Manager, Azure Key Vault, or Google Cloud Secret Manager.
  - Use Kubernetes Secrets to store references or credentials for accessing the external secrets store.
- **Secrets Encryption Providers:**
  - Kubernetes supports encrypting Secret data through KMS providers (use the KMS v2 API). This lets you manage the encryption keys outside Kubernetes.

**Documentation:** [https://kubernetes.io/docs/concepts/configuration/secret/#best-practices](https://kubernetes.io/docs/concepts/configuration/secret/#best-practices)

### 127. Describe the process of scaling a Kubernetes Deployment using the Horizontal Pod Autoscaler (HPA).

**Answer:**

**Scaling with HPA:**

1. **Create an HPA:** Define an HPA resource that targets your Deployment and specifies the scaling metrics (e.g., CPU utilization) and thresholds.

   ```yaml
   apiVersion: autoscaling/v2
   kind: HorizontalPodAutoscaler
   metadata:
     name: my-deployment-hpa
   spec:
     scaleTargetRef:
       apiVersion: apps/v1
       kind: Deployment
       name: my-deployment
     minReplicas: 3
     maxReplicas: 10
     metrics:
     - type: Resource
       resource:
         name: cpu
         target:
           type: Utilization
           averageUtilization: 50 # Target 50% CPU utilization
   ```

2. **Apply the HPA:** Apply the HPA to your cluster: `kubectl apply -f hpa.yaml`

**How it Works:**

- **Metric Collection:**  The Metrics Server (or a custom metrics provider) collects metrics from your Pods.
- **HPA Monitoring:**  The HPA continuously monitors the collected metrics.
- **Scaling Decisions:** If the metrics exceed the configured thresholds (e.g., CPU utilization is consistently above 50%), the HPA will increase or decrease the number of replicas in the Deployment to maintain the target resource utilization.
- **Requirement:** For a `Utilization` target, every container in the Pods must set `resources.requests`. Without them the HPA cannot compute a percentage and reports `unknown` metrics.

**Documentation:** [https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/)

### 128. What are some common causes of a Kubernetes Pod being stuck in a "Pending" state?

**Answer:**

**Reasons for "Pending" Pods:**

- **Insufficient Resources:**  The cluster might not have enough available resources (CPU, memory) to schedule the Pod.
- **Image Pull Issues:**  Kubernetes might be unable to pull the container image due to:
  - Incorrect image name or tag.
  - Private registry authentication problems.
  - Network connectivity issues.
- **Node Scheduling Issues:**
  - Node selectors or affinity rules in the Pod specification might be preventing it from being scheduled on suitable nodes.
  - Nodes might be tainted, and the Pod lacks matching tolerations.
- **PVC Pending:**  If the Pod uses a PersistentVolumeClaim (PVC), the PVC might still be in a "Pending" state because:
  - No matching PersistentVolume (PV) is available.
  - StorageClass provisioning is taking time.
- **Unsatisfiable Scheduling Constraints:** Pod anti-affinity or `topologySpreadConstraints` that no node can satisfy.
- **Creation Rejected (no Pending Pod):** ResourceQuota and admission webhooks reject the Pod before it is stored, so it never appears as Pending. Look for `FailedCreate` events on the ReplicaSet instead.

**Troubleshooting Steps:**

- **`kubectl describe pod <pod-name>`:** Check the "Events" section for clues about the pending state.
- **`kubectl get nodes`:**  Inspect node status and resources.
- **`kubectl get events`:** Look for events related to the Pod or its resources.
- **`kubectl get pvc`:** Check whether a PersistentVolumeClaim the Pod uses is stuck in `Pending`.

### 129. How do you configure a Pod to restart automatically if it exits with an error in Kubernetes?

**Answer:**

Use the `restartPolicy` field in the Pod specification.

**Restart Policy Options:**

- **`Always`:**  (Default) Restart the container automatically if it exits, regardless of the exit code.
- **`OnFailure`:**  Restart the container only if it exits with a non-zero exit code (indicating an error).
- **`Never`:**  Never restart the container.

Restarts happen in place on the same node, and the kubelet waits longer between each one (exponential back-off, shown as `CrashLoopBackOff`). The policy applies to every container in the Pod.

**Example:**

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  restartPolicy: OnFailure # Pod-level field: Always (default), OnFailure, or Never
  containers:
  - name: my-container
    image: my-image
```

**Documentation:** [https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#restart-policy](https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#restart-policy)

### 130.  Explain the concept of a Kubernetes CronJob and provide an example of its scheduling syntax.

**Answer:**

**Kubernetes CronJob:**

- A CronJob creates and manages Jobs on a schedule, similar to cron jobs in Linux/Unix systems.

**Scheduling Syntax Example:**

```text
0 0 * * *  # Run at midnight every day
```

**Field Breakdown:**

```text
* * * * *
| | | | |
| | | | ----- Day of week (0 - 6) (Sunday=0)
| | | ------- Month (1 - 12)
| | --------- Day of month (1 - 31)
| ----------- Hour (0 - 23)
------------- Minute (0 - 59)
```

**CronJob Example:**

```yaml
apiVersion: batch/v1
kind: CronJob
metadata:
  name: daily-backup
spec:
  schedule: "0 0 * * *"  # Run at midnight every day
  jobTemplate:
    spec:
      template:
        spec:
          restartPolicy: OnFailure # Job pods must use Never or OnFailure
          containers:
          - name: backup-job
            image: backup-image
            command: ["/bin/sh", "-c", "backup_script.sh"]
```

**Documentation:** [https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/](https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/)

### 131. How do you configure a Liveness probe that checks the TCP socket connection of a container in a Pod?

**Answer:**

**TCP Socket Liveness Probe:**

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  containers:
  - name: my-container
    image: my-image
    livenessProbe:
      tcpSocket:
        port: 8080 # The port to check
      initialDelaySeconds: 15
      periodSeconds: 20
```

**Explanation:**

- **`tcpSocket`:**  Specifies that the probe should attempt to open a TCP connection to the specified `port` on the container.
- **`initialDelaySeconds`:** (Optional)  The number of seconds after the container starts before liveness probes are initiated.
- **`periodSeconds`:** (Optional) How often (in seconds) to perform the probe. Default: 10.
- **`failureThreshold`:** (Optional) Consecutive failures before the kubelet restarts the container. Default: 3.
- A TCP check only confirms that the port accepts connections. It does not verify application health.

**Documentation:** [https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/#define-a-tcp-liveness-probe](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/#define-a-tcp-liveness-probe)

### 132.  What are some advantages of using a managed Kubernetes service compared to self-managed Kubernetes?

**Answer:**

**Managed Kubernetes vs. Self-Managed:**

| Feature | Managed Kubernetes | Self-Managed Kubernetes |
|---|---|---|
| **Setup and Configuration** | Simplified; managed by the cloud provider |  Requires manual setup and configuration |
| **Scaling and Upgrades** | Automated or managed by the provider | Manual scaling and upgrades |
| **Maintenance and Monitoring** | Handled by the provider | Requires manual effort |
| **Security and Compliance** |  Often integrated with cloud provider's security features |  Security and compliance are your responsibility |
| **Cost** |  Typically higher, but may be offset by reduced operational costs |  Lower initial costs, but potentially higher operational costs |

**Advantages of Managed Kubernetes:**

- **Reduced Operational Overhead:**  Focus on applications, not cluster management.
- **Faster Time to Market:**  Deploy clusters and applications quickly.
- **Scalability and Availability:**  Leverage cloud provider's infrastructure for high availability and scalability.

**Examples of Managed Kubernetes Services:**

- Google Kubernetes Engine (GKE)
- Amazon Elastic Kubernetes Service (EKS)
- Azure Kubernetes Service (AKS)

### 133.  Explain the concept of Kubernetes resource requests and how they affect Pod scheduling.

**Answer:**

**Resource Requests:**

- Resource requests specify the amount of CPU and memory that the scheduler reserves for a container.
- Requests affect scheduling and QoS class only. They do not cap actual usage; use `limits` for that.

**Impact on Scheduling:**

- **Resource Availability:** The Kubernetes scheduler only schedules a Pod on a node if the node has sufficient *available* resources to meet the Pod's resource requests.
- **Resource Allocation:**  When a Pod is scheduled on a node, its requested resources are "reserved" for that Pod, even if the Pod is not actively using all of them. This prevents other Pods from being scheduled on the same node if they would exceed the node's available resources.

**Example:**

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  containers:
  - name: my-container
    image: my-image
    resources:
      requests:
        cpu: "250m"  # Request 0.25 CPU cores
        memory: "128Mi" # Request 128 MiB of memory
```

**Documentation:** [https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#resource-requests-and-limits-of-pod-and-container](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#resource-requests-and-limits-of-pod-and-container)

### 134.  What is the difference between `kubectl apply` and `kubectl create` commands?

**Answer:**

| Command | Purpose | Idempotency |
|---|---|---|
| `kubectl create` | Creates a new resource from a file or standard input. |  Not idempotent; running it again for the same name fails with `AlreadyExists`. |
| `kubectl apply` | Creates or updates a resource based on the configuration provided. | Idempotent; you can run it multiple times with the same configuration, and it will only create the resource once. Subsequent runs will update the resource if the configuration has changed. |

**Use Cases:**

- **`kubectl create`:** Useful for creating resources for the first time, especially when you know the resource name should be unique.
- **`kubectl apply`:** Preferred for managing resources declaratively, as it can both create and update resources based on their configuration.

**Documentation:**

- `kubectl create`: [https://kubernetes.io/docs/reference/kubectl/generated/](https://kubernetes.io/docs/reference/kubectl/generated/)
- `kubectl apply`: [https://kubernetes.io/docs/reference/kubectl/generated/](https://kubernetes.io/docs/reference/kubectl/generated/)

### 135.  How do you implement a "leader election" pattern for Pods in Kubernetes?

**Answer:**

**Leader Election in Kubernetes:**

- The leader election pattern ensures that only one Pod (the "leader") in a set of Pods is actively performing a specific task at a time.
- This is useful for tasks that should not be run concurrently by multiple Pods, such as:
  - Updating a shared resource.
  - Performing a scheduled job.
  - Acting as a primary coordinator.

**Implementation:**

- **Kubernetes Leases:** Kubernetes provides a built-in lease object that can be used for leader election.
- **Libraries and Frameworks:** There are libraries and frameworks available (e.g., `client-go` leader election library) that simplify leader election implementation.

**Documentation:** [https://kubernetes.io/docs/concepts/architecture/leases/#leader-election](https://kubernetes.io/docs/concepts/architecture/leases/#leader-election)

### 136. Explain the purpose and functionality of the Kubernetes API aggregation layer.

**Answer:**

**API Aggregation Layer:**

- The API aggregation layer allows you to extend the Kubernetes API server by adding custom APIs.
- It's a mechanism for plugging in additional API endpoints to the main Kubernetes API server.

**Purpose:**

- **Extend Kubernetes:** Introduce new functionality and resources without modifying the core Kubernetes codebase.
- **Integration with Third-Party Tools:** Integrate Kubernetes with external systems and services by providing custom API endpoints.
- **Custom API Backends:** Serve resource types that CRDs cannot express, such as custom storage behavior, through your own API server.

**Functionality:**

- **API Registration:** Custom API servers register with the main Kubernetes API server using the APIService resource.
- **Proxy Requests:** When a request for a custom API endpoint is received by the main API server, it proxies the request to the appropriate custom API server.

**Documentation:** [https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/apiserver-aggregation/](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/apiserver-aggregation/)

### 137. How do you configure a Kubernetes Deployment to roll back to a previous revision if a new update fails?

**Answer:**

**Failed Rollouts in Deployments:**

- Kubernetes Deployments do not roll back automatically when a new update fails to deploy successfully. The rollout stalls, and `progressDeadlineSeconds` marks the Deployment as failed. You then roll back manually with `kubectl rollout undo` or through your CD tooling.

**Configuration Options:**

- **`revisionHistoryLimit`:**  (Optional) Specifies the number of old ReplicaSets to keep. These old ReplicaSets enable rollbacks. By default, Kubernetes keeps 10 old ReplicaSets.

**Rollback Trigger:**

- **Deployment Failure:**  If new Pods never become ready, the Deployment reports `ProgressDeadlineExceeded` once `progressDeadlineSeconds` (default 600) has passed.

**Manual Rollback:**

- You can also manually trigger a rollback using:

   ```bash
   kubectl rollout undo deployment/<deployment-name>
   ```

**Documentation:** [https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#rollback-and-rollout-history](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#rollback-and-rollout-history)

### 138.  What is the purpose of Kubernetes namespaces from a security perspective?

**Answer:**

**Namespaces for Security:**

- **Resource Isolation:** Namespaces provide a logical boundary for separating resources (Pods, Services, Deployments) within a cluster.
- **Access Control:** RBAC (Role-Based Access Control) policies can be applied at the namespace level, limiting access to resources based on user roles and permissions.
- **Network Segmentation:** NetworkPolicies can be used to restrict network traffic between namespaces, providing an additional layer of security.
- **Resource Quotas:** Resource quotas prevent one namespace from consuming excessive resources, protecting other namespaces from resource starvation.
- **Pod Security Admission:** Namespace labels such as `pod-security.kubernetes.io/enforce: restricted` enforce the Pod Security Standards.

**Security Benefits:**

- **Least Privilege:**  Enforce the principle of least privilege by granting users access only to the namespaces and resources they need.
- **Reduced Blast Radius:**  Limits how far a breach spreads. Namespaces alone are not a hard isolation boundary, because Pods in different namespaces still share nodes and the kernel.
- **Improved Auditing:** Audit events and metrics carry the namespace, so security-related events are easier to filter.

**Documentation:** [https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/) (and related documentation on RBAC and NetworkPolicies)

### 139. How do you troubleshoot a Kubernetes Pod that is stuck in an "ImagePullBackOff" state?

**Answer:**

**Troubleshooting "ImagePullBackOff":**

1. **Verify Image Name and Tag:**
   - Ensure that the image name and tag in the Pod specification are correct and match the image in your registry.

2. **Check Registry Connectivity:**
   - Verify that nodes in your cluster can reach the image registry.
   - Use `ping`, `nslookup`, or `curl` from a node to test connectivity.

3. **Private Registry Authentication:**
   - If using a private registry, ensure that you have created a Secret containing the registry credentials and that it is correctly referenced in the Pod's `imagePullSecrets` field.

4. **Image Existence:**
   - Confirm that the image actually exists in the registry.
   - Log in to the registry and check the image repository.

5. **Read the Pod Events:**
   - Run `kubectl describe pod <pod-name>` and read the exact pull error (e.g., `unauthorized`, `manifest unknown`, or `429 Too Many Requests` from a registry rate limit). The error shows which of the steps above applies.

**Documentation:** [https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/)

### 140. Explain the purpose and functionality of Kubernetes Admission Webhooks.

**Answer:**

**Admission Webhooks:**

- Admission webhooks are HTTP callbacks that are triggered during specific events in the Kubernetes API request lifecycle (e.g., resource creation, updates).
- They allow you to extend the Kubernetes API server's admission control process with custom logic.

**Purpose:**

- **Custom Validation:**  Enforce custom validation rules that go beyond the built-in admission controllers.
- **Security Policies:**  Implement complex security policies or integrate with external security systems.
- **Resource Modification:**  Modify resources before they are created or updated, for example, injecting default labels or annotations.

**Functionality:**

1. **Webhook Registration:** You register webhooks using the `ValidatingWebhookConfiguration` or `MutatingWebhookConfiguration` objects.
2. **API Request Interception:**  When an API request matches a webhook's configuration, the API server sends a request to the webhook's endpoint.
3. **Webhook Logic:** Your webhook code processes the request and either approves, rejects, or modifies the request.
4. **Failure Handling:** `failurePolicy: Fail` rejects the request if the webhook is unreachable or times out; `Ignore` admits it. A failing webhook with `Fail` can block every matching create, so run it highly available and set a short `timeoutSeconds`.

**Documentation:** [https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/#webhook](https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/#webhook)

### 141.  How do you configure a Pod to be scheduled on a node with a specific label in Kubernetes?

**Answer:**

Use **Node Selectors** in your Pod specification to match nodes with specific labels. Label the target node first, for example with `kubectl label nodes <node-name> disktype=ssd`.

**Example:**

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  nodeSelector:
    disktype: ssd # Only schedule on nodes with label "disktype: ssd"
  containers:
  - name: my-container
    image: nginx
```

**Explanation:**

- The `nodeSelector` field tells Kubernetes to only schedule the Pod on nodes that have the label `disktype: ssd`.

**Documentation:** [https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#nodeselector](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#nodeselector)

### 142. What are some best practices for managing Kubernetes YAML configuration files?

**Answer:**

**Best Practices for YAML Management:**

- **Version Control:** Use Git or another version control system to track changes to your YAML files.
- **Templates and Templating Tools:**  Use templating tools (Helm, Kustomize) to create reusable configuration templates and manage variations between environments.
- **Modularization:**  Break down large YAML files into smaller, more manageable modules.
- **Validation:**  Check manifests before applying them. `kubectl apply --dry-run=server -f <file>` validates against the API server, and `kubectl diff -f <file>` shows what would change.
- **Comments and Documentation:** Add clear and concise comments to your YAML files to explain the purpose of different sections and configurations.
- **Linting:** Use YAML linters to ensure consistent formatting, indentation, and adherence to best practices.

**Documentation:** While there's no single page dedicated to YAML management, these practices are recommended throughout Kubernetes documentation, especially in relation to configuration and deployment best practices.

## License

Copyright 2026 Stanislav. Licensed under [CC BY 4.0](LICENSE).
