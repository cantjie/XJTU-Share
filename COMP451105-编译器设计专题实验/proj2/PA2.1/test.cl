class CellularAutomaton inherits IO {
    population_map : String;
    init(map : String) : SELF_TYPE {
        {
            population_map <- map;
            self;
        }
    };

