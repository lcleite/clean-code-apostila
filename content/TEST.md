#### {#test} Conteúdo de teste

{% label %}android.java{% endlabel %}
```java
 ...
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ...
    }

    @Override
    protected void onStart() {
        super.onStart();
        ...
    }

    @Override
    protected void onRestart() {
        super.onRestart();
        ...
    }

    @Override
    protected void onResume() {
        super.onResume();
        ...
    }

    @Override
    protected void onPause() {
        super.onPause();
        ...
    }

    @Override
    protected void onStop() {
        super.onStop();
        ...
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        ...
    }
 ...
 ```

{% label %}ios.swift{% endlabel %}
 ```swift
 ...
    override func viewWillAppear(test animated: Bool) {
        getShows()
        decideLeftBarButtonItems()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarAppearanceSetupSGPMOBDefault()
        tableViewInitialSetup()
        getShows()
        checkOneShowAccess()
        setInitialSelectedTab()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        downloadOrUpdateShowsAutomatically()
    }
...
 ```