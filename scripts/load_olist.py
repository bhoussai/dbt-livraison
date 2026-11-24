import duckdb, glob, os

con = duckdb.connect("livraison.duckdb")
con.execute("drop schema if exists raw cascade")
con.execute("create schema raw")

for f in sorted(glob.glob("data/*.csv")):
    t = os.path.basename(f)[:-4].replace("olist_", "").replace("_dataset", "")
    if t == "geolocation":
        continue
    con.execute(f"create table raw.{t} as select * from read_csv('{f}', header=true, all_varchar=true)")
    cols = [c[0] for c in con.execute(f"describe raw.{t}").fetchall()]
    n = con.execute(f"select count(*) from raw.{t}").fetchone()[0]
    print(f"{t}: {n} lignes -> {cols}")