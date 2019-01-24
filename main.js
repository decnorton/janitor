const { spawnSync, execSync } = require('child_process')
const [command, ...args] = process.argv.slice(2)

switch (command) {
  case 'commit':
    const commitMessage = args.join(' ')
    if (!commitMessage) {
      throw `Please provide a descriptive commit message!`
    }
    spawnSync('git', ['commit', '-a', '-F', '-'], {
      input: commitMessage + '\n',
    })
    break
  case 'push':
    if (!process.env.GITHUB_TOKEN) {
      throw `Maybe you forgot to enable the GITHUB_TOKEN secret?`
    }
    execSync('git push origin $(git rev-parse --abbrev-ref HEAD)', {
      stdio: 'inherit',
    })
    break
  default:
    throw `Expected a valid command (commit/push).`
}
