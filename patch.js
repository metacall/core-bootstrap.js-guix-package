const file = process.argv[2];

if (!file) {
	process.exit(1);
}

const package = require(file);
const { writeFileSync } = require('fs');

package.dependencies = {};
package.devDependencies = {};

console.log(package);

writeFileSync(file, JSON.stringify(package, null, 2));
