using System;
using System.Collections.Generic;

namespace PaperFabrkia.Entities;

public partial class Postavshik
{
    public int IdPostavshik { get; set; }

    public string? NamePostavshik { get; set; }

    public string? EmailPostavshik { get; set; }

    public string? PhonePostavshik { get; set; }

    public string? LogoPostavshik { get; set; }

    public virtual ICollection<Sklad> Sklads { get; set; } = new List<Sklad>();
}
